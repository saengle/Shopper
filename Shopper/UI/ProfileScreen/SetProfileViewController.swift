//
//  SetProfileViewController.swift
//  Shopper
//
//  Created by 쌩 on 6/13/24.
//

import UIKit

class SetProfileViewController: UIViewController {
    
    let profileView = ProfileView()
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
}
