//
//  ProfileImageButton.swift
//  Shopper
//
//  Created by 쌩 on 6/28/24.
//

import UIKit


// MARK:  프로필 사진이 들어가있는 이미지 버튼
class ProfileImageButton: UIButton {
    
    init(size: Resource.Image.ImageSize) {
        super.init(frame: .zero)
        setWholeUI(size: size)
    }
    
    func setWholeUI( size: Resource.Image.ImageSize) {
        self.layer.masksToBounds = true
        configureLayout(size: size)
        
        switch size {
        case Resource.Image.ImageSize.big:
            self.layer.borderColor = Resource.MyColors.primary.cgColor
            self.layer.cornerRadius = 50
            self.layer.borderWidth = 5
        case Resource.Image.ImageSize.selected:
            self.alpha = 1.0
            self.isEnabled = true
            self.layer.borderColor = Resource.MyColors.primary.cgColor
            self.layer.cornerRadius = (UIScreen.main.bounds.width - 62) / 8
            self.layer.borderWidth = 3
        case Resource.Image.ImageSize.unSelected:
            self.alpha = 0.5
            self.isEnabled = false
            self.layer.borderColor = Resource.MyColors.lightGray.cgColor
            self.layer.cornerRadius = (UIScreen.main.bounds.width - 62) / 8
            self.layer.borderWidth = 1
        }
    }
    
    private func configureLayout(size: Resource.Image.ImageSize) {
        if size == Resource.Image.ImageSize.big {
            self.snp.makeConstraints { make in
                make.width.height.equalTo(100)
            }
        }
    }
    override var isEnabled: Bool{
        didSet {
            alpha = isEnabled ? 1.0 : 1.0
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


