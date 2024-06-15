//
//  ProfileImageCell.swift
//  Shopper
//
//  Created by 쌩 on 6/14/24.
//

import UIKit

import SnapKit

class ProfileImageCell: UICollectionViewCell {
    
//    lazy var myImage = ProfileImageButton(size: Resource.Image.ImageSize.unSelected)
    
//    init(size: Resource.Image.ImageSize, style: String) {
//        print(#function)
//        super.init(frame: .zero)
//        let image = ProfileImageButton(size: size)
//        image.setImage(UIImage(named: style), for: .normal)
//        self.addSubview(image)
//        image.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        print(#function, "??")
//        self.addSubview(myImage)
//        myImage.snp.makeConstraints{
//            $0.edges.equalToSuperview()
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func makeCellImage(size: Resource.Image.ImageSize, style: String) {
        print(#function)
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
//        print("시끄러워")
//        myImage.setWholeUI(size: size)
//        myImage.setImage(UIImage(named: style), for: .normal)
//        
//        
    }
}
