//
//  SearchedViewController.swift
//  Shopper
//
//  Created by 쌩 on 6/17/24.
//

import UIKit

class SearchedViewController: UIViewController {
    
    let searchedView = SearchedView()
    
    override func loadView() {
        view = searchedView
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "기계식 키보드"
        searchedView.collectionView.delegate = self
        searchedView.collectionView.dataSource = self
        searchedView.collectionView.register(SearchedCollectionViewCell.self, forCellWithReuseIdentifier: SearchedCollectionViewCell.identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchedCollectionViewCell.identifier, for: indexPath) as? SearchedCollectionViewCell else { return UICollectionViewCell()}
//        cell.configureCell(data: <#T##Item#>, like: <#T##Bool#>)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
    
}
