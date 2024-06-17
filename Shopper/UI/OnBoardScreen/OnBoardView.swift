//
//  OnBoardView.swift
//  Shopper
//
//  Created by 쌩 on 6/13/24.
//

import UIKit

import SnapKit

class OnBoardView: UIView {
    
    let imageWitdh = UIScreen.main.bounds.width - 32
    
    let mainTitleLabel = {
        let lb = UILabel()
        lb.text = "Shopper"
        lb.textAlignment = .center
        lb.font = .boldSystemFont(ofSize: 50)
        lb.textColor = Resource.MyColors.primary
        return lb
    }()
    let mainImageLabel = {
        let iv = UIImageView()
        iv.image = UIImage(named: "launch")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    let startButton = BigButton(title: "시작하기")
    let nameLabel = {
        let lb = UILabel()
        lb.text = "김생근"
        lb.font = .boldSystemFont(ofSize: 29)
        lb.textColor = Resource.MyColors.primary
        return lb
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierachy(isLaunching: false)
        configureLayout(isLaunching: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierachy(isLaunching: Bool) {
        isLaunching ?  [mainTitleLabel, mainImageLabel, nameLabel].forEach{self.addSubview($0)} :  [mainTitleLabel, mainImageLabel, startButton].forEach{self.addSubview($0)}
    }
    func configureLayout(isLaunching: Bool) {
        mainTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide).inset(72)
            make.height.equalTo(60)
            make.width.equalTo(200)
        }
        mainImageLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.width.equalTo(imageWitdh)
            make.height.equalTo(imageWitdh * 26 / 32)
        }
        if isLaunching {
            nameLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(mainImageLabel.snp.bottom).offset(40)
            }
        } else {
            startButton.snp.makeConstraints { make in
                make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(16)
                make.centerX.equalToSuperview()
                make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(16)
            }
        }
        
    }
}
