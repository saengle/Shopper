//
//  SearchedViewController.swift
//  Shopper
//
//  Created by 쌩 on 6/17/24.
//

import UIKit

class SearchedViewController: UIViewController {
    
    let searchedView = SearchedView()
    var searchWord = ""
    var likeList = [String]()
    var mySort = Sort.sim
    private var myShop: [Shop] = []
    private var myItems: [Item] = []{
        didSet {
            self.searchedView.collectionView.reloadData()
        }
    }
    private var myTotal: Int = 0
    private var myPage: Int = 1
    let apiManager = ApiManager()
    override func loadView() {
        view = searchedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = UserManager.keyWord
        searchedView.collectionView.delegate = self
        searchedView.collectionView.dataSource = self
        searchedView.collectionView.prefetchDataSource = self
        searchedView.collectionView.register(SearchedCollectionViewCell.self, forCellWithReuseIdentifier: SearchedCollectionViewCell.identifier)
        callApi(query: UserManager.keyWord, sort: mySort) { responseBool in
            if responseBool {
                self.searchedView.collectionView.reloadData()
            }
        }
        addTargetSortButton()
        configureButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchedView.collectionView.reloadData()
    }
}
extension SearchedViewController {
    private func callApi(query: String, sort: Sort, completion: @escaping (Bool) -> ()) {
        apiManager.callRequest(query: query, sort: "\(sort)", start: myPage, type: Shop.self) { shop, error in
            guard let myShops = shop else { return }
            self.myShop.append(contentsOf: [myShops])
            guard let newItems = shop?.items else { return }
            self.myItems.append(contentsOf: newItems)
            self.myTotal = self.myShop.first?.total ?? 0
            let numberFormatter: NumberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result: String = numberFormatter.string(for: self.myTotal)!
            self.searchedView.setTotalLabel(total: result)
            completion(true)
        }
    }
    
    private func addTargetSortButton() {
        searchedView.buttonList.forEach{$0.addTarget(self, action: #selector(sortButtonClicked), for: .touchUpInside)}
    }
    
    @objc private func sortButtonClicked(_ sender: UIButton) {
        guard let tempString: String = sender.titleLabel?.text else {return}
        let mySortValue = tempString.replacingOccurrences(of: "   ", with: "")
        var tempSort = Sort.sim
        switch mySortValue {
        case Sort.sim.rawValue:
            tempSort = Sort.sim
        case Sort.date.rawValue:
            tempSort = Sort.date
        case Sort.dsc.rawValue:
            tempSort = Sort.dsc
        case Sort.asc.rawValue:
            tempSort = Sort.asc
        default:
            print("Sort변환중 문제가 발생했습니다.")
        }
        mySort = tempSort
        self.myItems.removeAll()
        self.myPage = 1
        callApi(query: UserManager.keyWord, sort: mySort) { responseBool in
            if responseBool {
                self.searchedView.collectionView.reloadData()
                if self.myItems.count > 0 && self.myPage <= self.myItems.count {
                    self.searchedView.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
                }
            }
        }
        configureButton()
    }
    
    private func configureButton() {
        for element in  self.searchedView.buttonList {
            if element.titleLabel?.text! ==  "   " + mySort.rawValue + "   " {
                element.setTitleColor(Resource.MyColors.white, for: .normal)
                element.backgroundColor = Resource.MyColors.darkGray
            } else {
                element.setTitleColor(Resource.MyColors.black, for: .normal)
                element.backgroundColor = Resource.MyColors.white
            }
        }
    }
    @objc private func addListButtonClicked(_ sender: UIButton) {
        guard let id = myItems[sender.tag].productID else {return}
        // 라이크리스트가 id를 갖고있으면 (삭제)
        if likeList.contains(id) {
            //인덱스 찾기
            let deleteIndex = likeList.firstIndex { num in
                num == id
            }
            RealmManager.shared.deleteLike(id: id) // realm에 라이크 제거
            likeList.remove(at: deleteIndex!) // 인덱스번째 엘리멘트 제거
            UserManager.likeList = self.likeList // 유저디폴츠에 적용(삭제).
        } else {
            if let myTitle = myItems[sender.tag].title,
               let myImage = myItems[sender.tag].image,
               let myLink = myItems[sender.tag].link,
               let myLprice = myItems[sender.tag].lprice,
               let myMallName = myItems[sender.tag].mallName {
                RealmManager.shared.createLike(data: RealmModel(id: id,title: myTitle, link: myLink, lprice: myLprice, mallName: myMallName, imagePath: myImage))
            }
            likeList = UserManager.likeList // 유저디폴츠 라이크리스트 받아오기
            self.likeList.append(id) // 임시 라이크리스트에 id 추가
            UserManager.likeList = self.likeList // 유저디폴츠 라이크리스트 추가
        }
        self.searchedView.collectionView.reloadData()
    }
}
// MARK:  CollectionView Prefetching
extension SearchedViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for item in indexPaths {
            // 현재 스크롤이 마지막에서 4번째를 보고있고, isEnd가 아닐때면 추가검색
            let count = myItems.count
            if count - 4 == item.row && myPage <= myTotal {
                myPage += 30
                callApi(query: UserManager.keyWord, sort: mySort) { responseBool in
                    if responseBool {
                        self.searchedView.collectionView.reloadData()
                    }
                }
            }
        }
    }
}

extension SearchedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchedCollectionViewCell.identifier, for: indexPath) as? SearchedCollectionViewCell else { return UICollectionViewCell()}
        if myItems.count >= indexPath.row {
            let items = self.myItems[indexPath.row]
            cell.configureCell(mallName: items.mallName, title: items.title, lprice: items.lprice, image: items.image, like: false)
            cell.addListButton.tag = indexPath.row
            cell.addListButton.addTarget(self, action: #selector(addListButtonClicked), for: .touchUpInside)
            for e in UserManager.likeList {
                if items.productID == e {
                    cell.setAddListButtonImage(like: true)
                }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let link = myItems[indexPath.row].link else { return }
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        UserManager.link = link
        guard let keyWord = myItems[indexPath.row].title else { return }
        UserManager.detailKeyWord = keyWord
        guard let id = myItems[indexPath.row].productID else { return }
        UserManager.nowId = id
        let vc = ItemDetailViewController()
        self.navigationController?.pushViewController((vc), animated: true)
    }
    
}
