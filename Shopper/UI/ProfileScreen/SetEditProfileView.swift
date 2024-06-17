//
//  ProfileView.swift
//  Shopper
//
//  Created by 쌩 on 6/13/24.
//

import UIKit

import SnapKit

class SetEditProfileView: UIView {
    
    let profileImageButton = ProfileImageButton(size: Resource.Image.ImageSize.big)
    
    let cameraImage = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "camera.fill")
        iv.tintColor = Resource.MyColors.white
        iv.backgroundColor = Resource.MyColors.primary
        iv.layer.borderColor = Resource.MyColors.primary.cgColor
        iv.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
        return iv
    }()
    let cameraCircleView = {
        let v = UIView()
        v.backgroundColor = Resource.MyColors.primary
        v.layer.cornerRadius = 13
        v.layer.masksToBounds = true
        v.layer.borderWidth = 2
        v.layer.borderColor = Resource.MyColors.primary.cgColor
        v.snp.makeConstraints { make in
            make.width.height.equalTo(26)
        }
        return v
    }()
    
    let textField = {
        let tf = UITextField()
        tf.placeholder = "닉네임을 입력해 주세요 :)"
        tf.font = Resource.Font.normal15
        return tf
    }()
    let lineView = {
        let v = UIView()
        v.backgroundColor = Resource.MyColors.lightGray
        v.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        return v
    }()
    
    let stateLabel = {
        let lb = UILabel()
        lb.text = TextValidation.letterCount.rawValue
        lb.textColor = Resource.MyColors.primary
        lb.font = Resource.Font.normal13
        return lb
    }()
    
    let doneButton = BigButton(title: "완료")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(profileImageButton)
        // MARK: 아래 인덱스 수정으로 프로필 사진 바꾸기
        profileImageButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(16)
        }
        self.addSubview(cameraCircleView)
        self.addSubview(cameraImage)
        cameraImage.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(profileImageButton).inset(8)
        }
        cameraCircleView.snp.makeConstraints { make in
            make.center.equalTo(cameraImage.snp.center)
        }
        self.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalTo(cameraImage.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(32)
            make.height.equalTo(44)
        }
        self.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
        self.addSubview(stateLabel)
        stateLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(32)
        }
        self.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.centerX.equalToSuperview()
            make.top.equalTo(stateLabel.snp.bottom).offset(16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func  setMainImage(image: String) {
        //이미지 수정 필요
        profileImageButton.setImage(UIImage(named: image), for: .normal)
    }
    func changeTextValidationLabel(state: String) {
        stateLabel.text = state
    }
}


