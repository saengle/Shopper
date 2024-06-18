//
//  SetProfileViewController.swift
//  Shopper
//
//  Created by 쌩 on 6/13/24.
//

import UIKit

class SetProfileViewController: UIViewController {
    
    let profileView = SetEditProfileView()
    var myName = ""
    var myProfile = ""
    var myTextValidation: TextValidation = TextValidation.letterCount
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        navigationItem.title = "PROFILE SETTING"
        navigationController?.navigationBar.tintColor = .black
        ButtonsAddTargets()
        self.setRandomImage(image: myProfile)
        self.profileView.setMainImage(image: myProfile)
        profileView.textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
    }
    // 프로필사진 고르고 돌아올 때 이미지 세팅
    override func viewWillAppear(_ animated: Bool) {
        if User.userProfile != "" {
            self.myProfile = User.userProfile
        }
        self.profileView.setMainImage(image: myProfile)
    }
}

extension SetProfileViewController {
    //TextField Validation & ProfileView Label Change
    @objc func textFieldEditingChanged(_ sender: Any?) {
        if let text = self.profileView.textField.text {
            myTextValidation = textValidate(text: text)
            self.profileView.changeTextValidationLabel(state: myTextValidation.rawValue)
        }
    }
    // TextField Validation Method
    private func textValidate(text: String) -> TextValidation {
        if text.count < 2 || text.count >= 10 {
            return TextValidation.letterCount
        } else if text.contains("@") || text.contains("#") || text.contains("$") || text.contains("%") {
            return TextValidation.specialCharacter
        } else if text.filter({ $0.isNumber }).count >= 1 {
            return TextValidation.haveNumber
        }
        self.myName = text
        return TextValidation.pass
    }
}

extension SetProfileViewController {
    
    private func ButtonsAddTargets() {
        profileView.profileImageButton.addTarget(self, action: #selector(imageButtonClicked), for: .touchUpInside)
        profileView.doneButton.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
    }
    
    @objc private func imageButtonClicked() {
        let vc = SetEditProfieImageViewController()
        vc.myProfile = self.myProfile
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationController?.pushViewController(SetEditProfieImageViewController(), animated: true)
    }
    // MARK:  가입버튼 클릭
    @objc private func doneButtonClicked() {

        // UI어플리케이션에서 첫번째 씬을 찾아서 ...
        if myTextValidation == TextValidation.pass {
            User.isUser = true
            User.userName = myProfile
            User.userName = myName
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy. MM. dd"
            let stringDate = formatter.string(from: Date())
            User.signInDay = stringDate
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            // 씬 딜리게이트 파일에 접근 ( 씬 딜리게이트 파일 안에 들어가면 윈도우를 찾아 올 수 있음.)
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            let vc = TabbarController()
            sceneDelegate?.window?.rootViewController = vc   // entrypoint
            sceneDelegate?.window?.makeKeyAndVisible()  //show
        }
    }
}

extension SetProfileViewController {
    private func setRandomImage(image: String){
        if image == "" {
            myProfile = Resource.Image.ImageList.allCases[0].list[Int.random(in: 0...Resource.Image.ImageList.allCases[0].list.count - 1)]
            User.userProfile = myProfile
        }
    }
}
