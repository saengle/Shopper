//
//  SettingHeaderView.swift
//  Shopper
//
//  Created by 쌩 on 6/18/24.
//

import UIKit

import SnapKit

class SettingHeaderView: UITableViewHeaderFooterView {
    
    let profileImage = {
        let bt = ProfileImageButton(size: Resource.Image.ImageSize.big)
        bt.isEnabled = false
        bt.setWholeUI(size: Resource.Image.ImageSize.big)
        return bt
    }()
    
    let nameLabel = {
        let lb = UILabel()
        lb.font = Resource.Font.bold16
        return lb
    }()
    
    let dateLabel = {
        let lb = UILabel()
        lb.font = Resource.Font.normal14
        lb.textColor = Resource.MyColors.gray
        return lb
    }()
    
    let chevronImage = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "chevron.right")
        iv.tintColor = Resource.MyColors.gray
        return iv
    }()
    
    let WholeButton = {
        let bt = UIButton()
        bt.backgroundColor = .clear
        bt.isEnabled = true
        return bt
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureHierachy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingHeaderView {
    func configureHeader() {
        
    }
    
    private func configureHierachy() {
        [profileImage, nameLabel, dateLabel, chevronImage, WholeButton].forEach{self.contentView.addSubview($0)}
    }
    private func configureLayout() {
        profileImage.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView.safeAreaLayoutGuide).inset(16)
            make.centerY.equalTo(self.contentView)
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
            make.bottom.equalTo(self.snp.centerY).offset(4)
        }
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
            make.top.equalTo(self.snp.centerY).offset(4)
        }
        chevronImage.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView)
            make.trailing.equalTo(self.contentView.safeAreaLayoutGuide).inset(16)
        }
        WholeButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
