//
//  SetProfileViewController.swift
//  Shopper
//
//  Created by 쌩 on 6/13/24.
//

import UIKit

class SetProfileViewController: UIViewController {
    
    let profileView = SetEditProfileView()
    var myGuest = Guest(isUser: false, user: [])
    var myName = ""
    var myProfile = ""
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
        print(vc.myProfile, self.myProfile)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationController?.pushViewController(SetEditProfieImageViewController(), animated: true)
    }
    
    @objc private func doneButtonClicked() {
        print(#function)
//        UserDefaults.standard.setValue(true, forKey: "isLogedIn")
        // UI어플리케이션에서 첫번째 씬을 찾아서 ...
        if myGuest.isUser && myGuest.user.count == 1 {
            
        }
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        // 씬 딜리게이트 파일에 접근 ( 씬 딜리게이트 파일 안에 들어가면 윈도우를 찾아 올 수 있음.)
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let vc = SearchViewController()
        let nvc = UINavigationController(rootViewController: vc)
        sceneDelegate?.window?.rootViewController = nvc   // entrypoint
        sceneDelegate?.window?.makeKeyAndVisible()  //show
    }

}
extension SetProfileViewController {
    private func setRandomImage(image: String){
        if image == "" {
            myProfile = Resource.Image.ImageList.allCases[0].list[Int.random(in: 0...Resource.Image.ImageList.allCases[0].list.count - 1)]
            UserDefaults.standard.set(myProfile, forKey: "UserProfile")
        }
    }
}
