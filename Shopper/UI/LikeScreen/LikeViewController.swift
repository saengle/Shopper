//
//  LikeViewController.swift
//  Shopper
//
//  Created by 쌩 on 7/9/24.
//

import UIKit

class LikeViewController: UIViewController {
    
    
    let likeView = LikeView()
    var searchWord = ""
    var likeList = [String]()
    
    private var myShop: [Shop] = []
    private var myItems: [Item] = []{
        didSet {
            self.likeView.collectionView.reloadData()
        }
    }
    private var myTotal: Int = 0
    private var myPage: Int = 1

    override func loadView() {
        view = likeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "장바구니"
        likeView.collectionView.delegate = self
        likeView.collectionView.dataSource = self
       
        likeView.collectionView.register(SearchedCollectionViewCell.self, forCellWithReuseIdentifier: SearchedCollectionViewCell.identifier)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        likeView.collectionView.reloadData()
    }
}
extension LikeViewController {
    @objc private func addListButtonClicked(_ sender: UIButton) {
        guard let id = myItems[sender.tag].productID else {return}
        // 라이크리스트가 id를 갖고있으면 (삭제)
        if likeList.contains(id) {
            //인덱스 찾기
            let deleteIndex = likeList.firstIndex { num in
                num == id
            }
            likeList.remove(at: deleteIndex!) // 인덱스번째 엘리멘트 제거
            UserManager.likeList = self.likeList // 유저디폴츠에 적용(삭제).
        } else {
            likeList = UserManager.likeList // 유저디폴츠 라이크리스트 받아오기
            self.likeList.append(id) // 임시 라이크리스트에 id 추가
            UserManager.likeList = self.likeList // 유저디폴츠 라이크리스트 추가
        }
        self.likeView.collectionView.reloadData()
    }
}

extension LikeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchedCollectionViewCell.identifier, for: indexPath) as? SearchedCollectionViewCell else { return UICollectionViewCell()}
        if myItems.count >= indexPath.row {
            let items = self.myItems[indexPath.row]
            cell.configureCell(data: items, like: false)
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
    
    
}
