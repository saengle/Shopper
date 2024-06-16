//
//  SearchedViewController.swift
//  Shopper
//
//  Created by 쌩 on 6/17/24.
//

import UIKit

class SearchedViewController: UIViewController {
    
    let searchedView = SearchedView()
    
    override func loadView() {
        view = searchedView
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "기계식 키보드"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
