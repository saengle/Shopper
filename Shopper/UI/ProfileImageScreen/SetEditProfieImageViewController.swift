//
//  SetProfieImageViewController.swift
//  Shopper
//
//  Created by 쌩 on 6/14/24.
//

import UIKit

class SetEditProfieImageViewController: UIViewController {
    
    let setEditView = SetEditProfileImageView()
    var myProfile = ""
    let vc = SetProfileViewController()
    override func loadView() {
        view = setEditView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myProfile = User.userProfile
        if User.isUser {
            navigationItem.title = "EDIT PROFILE"
        } else {
            navigationItem.title = "PROFILE SETTING"
        }
        
        navigationController?.navigationBar.tintColor = .black
        setEditView.profileCollectionView.register(ProfileImageCell.self, forCellWithReuseIdentifier: ProfileImageCell.identifier)
        setEditView.profileCollectionView.dataSource = self
        setEditView.profileCollectionView.delegate = self
        setEditView.setMainImage(image: myProfile)
        setEditView.profileCollectionView.allowsMultipleSelection = false
    }
}


extension SetEditProfieImageViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Resource.Image.ImageList.allCases[0].list.count
    }
    // MARK:  셀 그리기
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileImageCell.identifier, for: indexPath) as? ProfileImageCell else { return UICollectionViewCell()}
        if User.userProfile == Resource.Image.ImageList.allCases[0].list[indexPath.row] {
            cell.makeCellImage(size: Resource.Image.ImageSize.selected, style: Resource.Image.ImageList.allCases[0].list[indexPath.row])
        } else {
            cell.makeCellImage(size: Resource.Image.ImageSize.unSelected, style: Resource.Image.ImageList.allCases[0].list[indexPath.row])
        }
        return cell
    }
    // MARK:  선택 메서드
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileImageCell.identifier, for: indexPath) as? ProfileImageCell {
            myProfile = Resource.Image.ImageList.allCases[0].list[indexPath.row]
            User.userProfile = Resource.Image.ImageList.allCases[0].list[indexPath.row]
            //아래 메서드 살리면 전체 리로드 -> 부분 리로드
//            collectionView.reloadItems(at: [indexPath])
            setEditView.setMainImage(image: myProfile)
            collectionView.reloadData()
        }
    }
//    // MARK:  선택 풀리는 메서드 아예 실행이 안돼... 왜지..
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        print("실행이 안된다 ?")
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileImageCell.identifier, for: indexPath) as? ProfileImageCell {
////            cell.makeCellImage(size: Resource.Image.ImageSize.unSelected, style: Resource.Image.ImageList.allCases[0].list[indexPath.row])
//            print(indexPath, "를 청소해줘야하는데")
//            collectionView.reloadItems(at: [indexPath])
//        }
//        if let cell = collectionView.cellForItem(at: indexPath) as? ProfileImageCell {
//                   print("왜 안돼")
//               }
//    }
}
