//
//  SearchedCollectionViewCell.swift
//  Shopper
//
//  Created by 쌩 on 6/17/24.
//

import UIKit


class SearchedCollectionViewCell: UICollectionViewCell {
    
    let mainImageView = UIImageView()
    let addListButton = {
        let bt = UIButton()
        bt.layer.cornerRadius = 5
        bt.layer.masksToBounds = false
        return bt
    }()
    
    let mallNameLabel = {
        let lb = UILabel()
        lb.font = Resource.Font.normal13
        lb.textColor = Resource.MyColors.lightGray
        return lb
    }()
    
    let titleLabel = {
        let lb = UILabel()
        lb.font = Resource.Font.normal15
        lb.numberOfLines = 2
        return lb
    }()
    
    let lpriceLabel = {
        let lb = UILabel()
        lb.font = Resource.Font.bold16
        return lb
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        mallNameLabel.text = "네이버몰"
        titleLabel.text = "네이버에서 파는 춘천짜장면(짱맛있음!)"
        lpriceLabel.text = "35,605원"
        setAddListButtonImage(like: false)
        configureHierachy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(data: Item, like: Bool) {
        mallNameLabel.text = data.mallName
        titleLabel.text = data.title
        // MARK:  3자리 끊기
//        let formattedLP = data.lprice.
        lpriceLabel.text = data.lprice
        setAddListButtonImage(like: like)
        
    }
    
    private func configureHierachy() {
        [mainImageView, addListButton, mallNameLabel, titleLabel, lpriceLabel].forEach{contentView.addSubview($0)}
    }
    private func configureLayout() {
        mainImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo((UIScreen.main.bounds.width - 48) * 7 / 12)
        }
        addListButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(mainImageView).inset(16)
            make.height.width.equalTo(30)
        }
        mallNameLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(mallNameLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview()
        }
        lpriceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview()
        }
    }
    
    func setAddListButtonImage(like: Bool) {
        if like {
            addListButton.backgroundColor = Resource.MyColors.white
            addListButton.setImage(UIImage(named: "like_selected"), for: .normal)
        } else {
            addListButton.setImage(UIImage(named: "like_unselected"), for: .normal)
            addListButton.backgroundColor = Resource.MyColors.black.withAlphaComponent(0.3)
        }
        
    }
}
