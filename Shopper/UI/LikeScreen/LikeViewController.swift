//
//  LikeViewController.swift
//  Shopper
//
//  Created by 쌩 on 7/9/24.
//

import UIKit
import RealmSwift

class LikeViewController: UIViewController {
    
    let likeView = LikeView()
    var searchWord = ""
    var likeList = [String]()
    
    private var myItems: [RealmModel] = []{
        didSet {
            self.likeView.collectionView.reloadData()
        }
    }
    
    override func loadView() {
        view = likeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "장바구니"
        likeView.collectionView.delegate = self
        likeView.collectionView.dataSource = self
        myItems = RealmManager.shared.readLikes()
        likeView.collectionView.register(SearchedCollectionViewCell.self, forCellWithReuseIdentifier: SearchedCollectionViewCell.identifier)
        self.likeList = UserManager.likeList
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myItems = RealmManager.shared.readLikes()
        likeView.collectionView.reloadData()
    }
}
extension LikeViewController {
    @objc private func deleteLikeButtonClicked(_ sender: UIButton) {
        let id = myItems[sender.tag].id
        // 라이크리스트가 id를 갖고있으면 (삭제)
        //인덱스 찾기
         let deleteIndex = likeList.firstIndex { num in
            num == id
        }
        RealmManager.shared.deleteLike(id: id) // realm에 라이크 제거
        likeList.remove(at: deleteIndex!) // 인덱스번째 엘리멘트 제거
        UserManager.likeList = self.likeList // 유저디폴츠에 적용(삭제).
        self.myItems = RealmManager.shared.readLikes()
        self.likeView.collectionView.reloadData()
    }
}

extension LikeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        myItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchedCollectionViewCell.identifier, for: indexPath) as? SearchedCollectionViewCell else { return UICollectionViewCell()}
        if myItems.count >= indexPath.row {
            let items = self.myItems[indexPath.row]
            cell.configureCell(mallName: items.mallName, title: items.title, lprice: items.lprice, image: items.imagePath, like: true)
            cell.addListButton.tag = indexPath.row
            cell.addListButton.addTarget(self, action: #selector(deleteLikeButtonClicked), for: .touchUpInside)
            for e in UserManager.likeList {
                if items.id == e {
                    cell.setAddListButtonImage(like: true)
                }
            }
        }
        return cell
    }
}
