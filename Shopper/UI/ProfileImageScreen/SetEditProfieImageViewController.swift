//
//  SetProfieImageViewController.swift
//  Shopper
//
//  Created by 쌩 on 6/14/24.
//

import UIKit

class SetEditProfieImageViewController: UIViewController {
    
    let setEditView = SetEditProfileImageView()
    private let vc = SetEditProfileViewController()
     let vm = SetEditProfieImageViewModel()
    
    override func loadView() {
        view = setEditView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        bindData()
    }
}

extension SetEditProfieImageViewController {
    private func configureVC() {
        self.navigationItem.title = vm.getTitle()
        navigationController?.navigationBar.tintColor = .black
        
        setEditView.profileCollectionView.register(ProfileImageCell.self, forCellWithReuseIdentifier: ProfileImageCell.identifier)
        setEditView.profileCollectionView.dataSource = self
        setEditView.profileCollectionView.delegate = self
        setEditView.profileCollectionView.allowsMultipleSelection = false
    }
    private func bindData() {
        self.vm.outputProfile.bind { value in
            self.setEditView.setMainImage(image: value)
            self.setEditView.profileCollectionView.reloadData()
        }
    }
}

extension SetEditProfieImageViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Resource.Image.ImageList.allCases[0].list.count
    }
    // MARK:  셀 그리기
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileImageCell.identifier, for: indexPath) as? ProfileImageCell else { return UICollectionViewCell()}
        let image = Resource.Image.ImageList.allCases[0].list[indexPath.row]
        if vm.outputProfile.value == image {
            cell.makeCellImage(size: Resource.Image.ImageSize.selected, style: image)
        } else {
            cell.makeCellImage(size: Resource.Image.ImageSize.unSelected, style: image)
        }
        return cell
    }
    // MARK:  선택 메서드
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileImageCell.identifier, for: indexPath) as? ProfileImageCell {
            vm.inputSelectedIndex.value = indexPath.row
        }
    }
}
