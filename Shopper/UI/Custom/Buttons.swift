//
//  CustomButton.swift
//  Shopper
//
//  Created by 쌩 on 6/13/24.
//

import UIKit

import SnapKit
// MARK:  초기 화면들에서 쓰이는 큰 버튼
class BigButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(Resource.MyColors.white, for: .normal)
        titleLabel?.font = Resource.Font.bold16
        backgroundColor = Resource.MyColors.primary
        layer.cornerRadius = 24
        layer.masksToBounds = true
        
        self.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:  프로필 사진이 들어가있는 이미지 버튼
class profileImageButton: UIButton {
    
    init(style: Resource.Image.ImageSize) {
        super.init(frame: .zero)
        setWholeUI(style: style)

    }
    
    func setWholeUI( style: Resource.Image.ImageSize) {
        self.layer.masksToBounds = true
        configureLayout(style: style)
        
        switch style {
        case Resource.Image.ImageSize.big:
            self.tintColor = Resource.MyColors.primary
            self.layer.borderColor = Resource.MyColors.primary.cgColor
            self.layer.cornerRadius = 50
            self.layer.masksToBounds = true
            self.layer.borderWidth = 5
            self.layer.borderColor = Resource.MyColors.primary.cgColor
        case Resource.Image.ImageSize.selected:
            self.tintColor = Resource.MyColors.primary
            self.layer.borderColor = Resource.MyColors.primary.cgColor
            self.layer.cornerRadius = 20
            self.layer.masksToBounds = true
            self.layer.borderWidth = 3
            self.layer.borderColor = Resource.MyColors.primary.cgColor
        case Resource.Image.ImageSize.unSelected:
            self.tintColor = Resource.MyColors.lightGray
            self.alpha = 0.5
            self.layer.borderColor = Resource.MyColors.lightGray.cgColor
            self.layer.cornerRadius = 20
            self.layer.masksToBounds = true
            self.layer.borderWidth = 1
            self.layer.borderColor = Resource.MyColors.lightGray.cgColor
        }
    }
 
    func configureLayout(style: Resource.Image.ImageSize) {
       
        switch style {
        case Resource.Image.ImageSize.big:
            self.snp.makeConstraints { make in
                make.width.height.equalTo(100)
            }
        case Resource.Image.ImageSize.selected:
            self.snp.makeConstraints { make in
                make.width.height.equalTo(40)
            }
        case Resource.Image.ImageSize.unSelected:
            self.snp.makeConstraints { make in
                make.width.height.equalTo(40)
                
            }
            
        }
       
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
