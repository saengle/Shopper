//
//  ProfileView.swift
//  Shopper
//
//  Created by 쌩 on 6/13/24.
//

import UIKit

import SnapKit

class ProfileView: UIView {
    
    let profileImageView = profileImageButton(style: Resource.Image.ImageSize.big)
    
    let cameraImage = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "camera.fill")
        //        iv.preferredSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 500, weight: .light)
        iv.tintColor = Resource.MyColors.white
        iv.backgroundColor = Resource.MyColors.primary
        //        iv.layer.cornerRadius = 5
        //        iv.layer.masksToBounds = true
        //        iv.layer.borderWidth = 2
        iv.layer.borderColor = Resource.MyColors.primary.cgColor
        iv.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
        return iv
    }()
    let cameraCircleView = {
        let v = UIView()
        v.backgroundColor = Resource.MyColors.primary
        v.layer.cornerRadius = 13
        v.layer.masksToBounds = true
        v.layer.borderWidth = 2
        v.layer.borderColor = Resource.MyColors.primary.cgColor
        v.snp.makeConstraints { make in
            make.width.height.equalTo(26)
        }
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(profileImageView)
        profileImageView.setImage(Resource.Image.ImageStyle.image0, for: .normal)
        profileImageView.snp.makeConstraints { make in
            //            make.top.equalTo(safeAreaLayoutGuide).inset(16)
            make.centerY.centerX.equalToSuperview()
        }
        self.addSubview(cameraCircleView)
        self.addSubview(cameraImage)
        cameraImage.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(profileImageView).inset(8)
        }
        cameraCircleView.snp.makeConstraints { make in
            make.center.equalTo(cameraImage.snp.center)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

