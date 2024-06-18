//
//  SearchTableViewCell.swift
//  Shopper
//
//  Created by 쌩 on 6/16/24.
//

import UIKit

import SnapKit

class SearchTableViewCell: UITableViewCell {
    
    let watchImage = UIImageView()
    let titleLabel = UILabel()
    let removeButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierachy()
        configureLayout()
        removeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        removeButton.tintColor = Resource.MyColors.black
        removeButton.isEnabled = true
        watchImage.image = UIImage(systemName: "clock")
        watchImage.tintColor = Resource.MyColors.black
        titleLabel.font = Resource.Font.normal14
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension SearchTableViewCell {
    private func configureHierachy() {
        contentView.addSubview(watchImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(removeButton)
    }
    private func configureLayout() {
        watchImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
            make.width.lessThanOrEqualTo(watchImage.snp.height)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(watchImage.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(removeButton.snp.leading).offset(-8)
        }
        removeButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }
    }
    func configureCell(title: String) {
        titleLabel.text = title
    }
}
