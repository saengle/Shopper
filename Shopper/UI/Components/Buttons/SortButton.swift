//
//  SortButton.swift
//  Shopper
//
//  Created by 쌩 on 6/28/24.
//

import UIKit



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

