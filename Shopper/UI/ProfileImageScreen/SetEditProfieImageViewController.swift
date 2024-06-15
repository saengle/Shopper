//
//  SetProfieImageViewController.swift
//  Shopper
//
//  Created by 쌩 on 6/14/24.
//

import UIKit

class SetEditProfieImageViewController: UIViewController {
    
    let setEditView = SetEditProfileImageView()
    
    override func loadView() {
        view = setEditView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "PROFILE SETTING"
        navigationController?.navigationBar.tintColor = .black
        setEditView.profileCollectionView.register(ProfileImageCell.self, forCellWithReuseIdentifier: ProfileImageCell.identifier)
        setEditView.profileCollectionView.dataSource = self
        setEditView.profileCollectionView.delegate = self
    }
}

extension SetEditProfieImageViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Resource.Image.ImageList.allCases[0].list.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = setEditView.profileCollectionView.dequeueReusableCell(withReuseIdentifier: ProfileImageCell.identifier, for: indexPath) as? ProfileImageCell else { return UICollectionViewCell()}
//        cell.makeCellImage(size: Resource.Image.ImageSize.unSelected, style: (Resource.Image.ImageStyle.allCases[indexPath.row] as? UIImage)!)
        cell.makeCellImage(size: Resource.Image.ImageSize.unSelected, style: Resource.Image.ImageList.allCases[0].list[indexPath.row])
        print(#function, "이게 지금은 안되는데 ?")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? ProfileImageCell {
//            cell.makeCellImage(size: Resource.Image.ImageSize.selected, style: Resource.Image.ImageList.allCases[0].list[indexPath.row])
//        }
        if let cell = setEditView.profileCollectionView.dequeueReusableCell(withReuseIdentifier: ProfileImageCell.identifier, for: indexPath) as? ProfileImageCell {
            cell.makeCellImage(size: Resource.Image.ImageSize.selected, style: Resource.Image.ImageList.allCases[0].list[indexPath.row])
            collectionView.reloadItems(at: [indexPath])
            
        }

       
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileImageCell.identifier, for: indexPath) as? ProfileImageCell {
            cell.makeCellImage(size: Resource.Image.ImageSize.unSelected, style: Resource.Image.ImageList.allCases[0].list[indexPath.row])
            collectionView.reloadItems(at: [indexPath])
        }
    }
}
