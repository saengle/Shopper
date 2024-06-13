//
//  SetProfileViewController.swift
//  Shopper
//
//  Created by 쌩 on 6/13/24.
//

import UIKit

class SetProfileViewController: UIViewController {
    
    let profileView = SetEditProfileView()
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        navigationItem.title = "PROFILE SETTING"
        navigationController?.navigationBar.tintColor = .black
    }
}
