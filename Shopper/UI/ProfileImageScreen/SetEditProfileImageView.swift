//
//  SetEditProfileImageView.swift
//  Shopper
//
//  Created by 쌩 on 6/14/24.
//

import UIKit

import SnapKit



class SetEditProfileImageView: UIView {
    
    let profileImageView = ProfileImageButton(size: Resource.Image.ImageSize.big)
    
    lazy var profileCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
    func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width - 32
        layout.itemSize = CGSize(width: (width - 30) / 4  , height:  (width - 30) / 4 )
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return layout
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Resource.MyColors.white
        configureHierachy()
        configureLayout()
        profileCollectionView.isScrollEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SetEditProfileImageView {
    private func configureHierachy() {
        self.addSubview(profileImageView)
        self.addSubview(profileCollectionView)

    }
    private func configureLayout() {
       
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(16)
        }
        profileCollectionView.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(32)
            make.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide).inset(16)
        }
    }
    func  setMainImage(image: String) {
        profileImageView.setImage(UIImage(named: image), for: .normal)
    }
    
}
