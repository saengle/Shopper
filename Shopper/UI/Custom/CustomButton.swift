//
//  CustomButton.swift
//  Shopper
//
//  Created by 쌩 on 6/13/24.
//

import UIKit

import SnapKit

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

