//
//  SettingTableViewCell.swift
//  Shopper
//
//  Created by 쌩 on 6/17/24.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    let mainLabel = {
        let lb = UILabel()
        lb.font = Resource.Font.normal14
        return lb
    }()
    let myImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "like_selected")
        return iv
    }()
    let countLabel = {
        let lb = UILabel()
        lb.font = Resource.Font.bold16
        return lb
    }()
    let subLabel = {
        let lb = UILabel()
        lb.font = Resource.Font.normal14
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: SettingTableViewCell.identifier)
        ordinarySetting()
    }
    
    private func ordinarySetting() {
        contentView.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            make.centerY.equalToSuperview()
        }
    }
    
    func setLikeList() {
        subLabel.text = "의 상품"
        contentView.addSubview(subLabel)
        subLabel.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            make.centerY.equalToSuperview()
        }
        countLabel.text = "18개"
        contentView.addSubview(countLabel)
        countLabel.snp.makeConstraints { make in
            make.trailing.equalTo(subLabel.snp.leading)
            make.centerY.equalToSuperview()
        }
        contentView.addSubview(myImageView)
        myImageView.snp.makeConstraints { make in
            make.trailing.equalTo(countLabel.snp.leading).offset(-4)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

