//
//  ProfileImageCell.swift
//  Shopper
//
//  Created by 쌩 on 6/14/24.
//

import UIKit

import SnapKit

class ProfileImageCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func makeCellImage(size: Resource.Image.ImageSize, style: String) {
        let whiteView = UIView()
        whiteView.backgroundColor = Resource.MyColors.white
        self.addSubview(whiteView)
        whiteView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        let image = ProfileImageButton(size: size)
        image.setImage(UIImage(named: style), for: .normal)
        whiteView.addSubview(image)
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }     
    }
}
