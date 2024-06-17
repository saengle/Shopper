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
    var oldLikeList = [String]()
    var likeList = [String]()
    private var myShop: [Shop] = []
    private var myTotal: Int = 0
    private var myPage: Int = 0
    let apiManager = ApiManager()
    override func loadView() {
        view = searchedView
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = User.keyWord
        searchedView.collectionView.delegate = self
        searchedView.collectionView.dataSource = self
        searchedView.collectionView.register(SearchedCollectionViewCell.self, forCellWithReuseIdentifier: SearchedCollectionViewCell.identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.callShoppingRequest(query: User.keyWord, sort: "sim") { result in
            switch result{
            case .success(let shop):
                guard let shop = shop as? Shop else { return }
                self.myShop.append(contentsOf: [shop])
                self.searchedView.collectionView.reloadData()
                self.myTotal = self.myShop.first?.total ?? 0
                // MARK:  3자리 끊기
                let numberFormatter: NumberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                let result: String = numberFormatter.string(for: self.myTotal)!
                self.searchedView.setTotalLabel(total: result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
extension SearchedViewController {
    @objc private func addListButtonClicked(_ sender: UIButton) {
        guard let id = self.myShop.first?.items?[sender.tag].productID else {return}
        // 라이크리스트가 id를 갖고있으면 (삭제)
        if likeList.contains(id) {
            //인덱스 찾기
           let deleteIndex = likeList.firstIndex { num in
                num == id
            }
            likeList.remove(at: deleteIndex!) // 인덱스번째 엘리멘트 제거
            User.likeList = self.likeList // 유저디폴츠값 리셋시키기.
        } else {
            likeList = User.likeList
            self.likeList.append(id) //
            User.likeList = self.likeList
        }
        self.searchedView.collectionView.reloadData()
    }
}
extension SearchedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myShop.first?.items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchedCollectionViewCell.identifier, for: indexPath) as? SearchedCollectionViewCell else { return UICollectionViewCell()}
        guard let items = self.myShop.first?.items?[indexPath.row] else { return cell }
        cell.configureCell(data: items, like: false)
        cell.addListButton.tag = indexPath.row
        cell.addListButton.addTarget(self, action: #selector(addListButtonClicked), for: .touchUpInside)
        for e in User.likeList {
            if items.productID == e {
                cell.setAddListButtonImage(like: true)
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let link = self.myShop.first?.items?[indexPath.row].link else { return }
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        User.link = link
        guard let keyWord = self.myShop.first?.items?[indexPath.row].title else { return }
        User.detailKeyWord = keyWord
        let vc = ItemDetailViewController()
        self.navigationController?.pushViewController((vc), animated: true)
    }
    
}
