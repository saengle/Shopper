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

extension SearchedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myShop.first?.items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchedCollectionViewCell.identifier, for: indexPath) as? SearchedCollectionViewCell else { return UICollectionViewCell()}
        guard let items = self.myShop.first?.items?[indexPath.row] else { return cell }
        cell.configureCell(data: items, like: false)
        //        if User.likeList.con == self.myShop.first?.items[indexPath.row].productID {
        //
        //        } else {
        //
        //        }
        //
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
