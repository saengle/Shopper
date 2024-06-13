//
//  OnBoardView.swift
//  Shopper
//
//  Created by 쌩 on 6/13/24.
//

import UIKit

class OnBoardView: UIView {
    
    let MainTitleLabel = {
        let lb = UILabel()
        return lb
    }()
    let MainImageLabel = {
        let iv = UIImageView()
        return iv
    }()
    let StartButton = {
        let bt = UIButton()
        return bt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
