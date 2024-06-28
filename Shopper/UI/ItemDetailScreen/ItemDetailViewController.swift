//
//  ItemDetailViewController.swift
//  Shopper
//
//  Created by 쌩 on 6/17/24.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    let itemDetailView = ItemDetailView()
    var likeList = [String]()
    // Create right UIBarButtonItem.
    lazy var rightButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(buttonPressed))
        button.isEnabled = true
        return button
    }()
    var nowId = ""
    override func loadView() {
        view = itemDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nowId = UserManager.nowId
        navigationController?.navigationBar.tintColor = .black
        let mySortValue = UserManager.detailKeyWord.replacingOccurrences(of: "<b>", with: "")
        navigationItem.title = mySortValue.replacingOccurrences(of: "</b>", with: "")
        navigationItem.rightBarButtonItem = rightButton
        makeLikeButton()
        itemDetailView.configureView(url: UserManager.link)
    }
}

extension ItemDetailViewController {
    @objc
    private func buttonPressed() {
        likeList = UserManager.likeList
        // 라이크리스트가 id를 갖고있으면 (삭제)
        if likeList.contains(nowId) {
            //인덱스 찾기
           let deleteIndex = likeList.firstIndex { num in
                num == nowId
            }
            likeList.remove(at: deleteIndex!) // 인덱스번째 엘리멘트 제거
            UserManager.likeList = self.likeList // 유저디폴츠에 적용(삭제).
        } else {
            self.likeList.append(nowId) // 임시 라이크리스트에 id 추가
            UserManager.likeList = self.likeList // 유저디폴츠 라이크리스트 추가
        }
       makeLikeButton()
    }
    private func makeLikeButton() {
        for e in UserManager.likeList {
            if UserManager.nowId == e {
                rightButton.image = UIImage(named: "like_selected")
            } else {
                // 이미지 이상하게 나오는거 수정 필요.
                rightButton.image = UIImage(named: "like_unselected")
            }
        }
        if UserManager.likeList.count == 0 {
            rightButton.image = UIImage(named: "like_unselected")
        }
    }
}
