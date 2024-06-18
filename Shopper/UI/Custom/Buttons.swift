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
// isEnabled = false 로 설정했을 때 alpha가 줄어드는거 수정하고싶다.. 
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
    open override var isEnabled: Bool{
           didSet {
               alpha = isEnabled ? 1.0 : 1.0
           }
       }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SortButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        let myTitle = "   " + title + "   "
        setTitle(myTitle, for: .normal)
        layer.cornerRadius = 14
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = Resource.MyColors.lightGray.cgColor
        titleLabel?.font = Resource.Font.normal13
        setTitleColor(Resource.MyColors.black, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/* 
 setTitle(title, for: .normal)
 var configuration = UIButton.Configuration.filled()
 configuration.cornerStyle = .capsule
 self.configuration = configuration
 */
