//
//  ItemDetailViewController.swift
//  Shopper
//
//  Created by 쌩 on 6/17/24.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    let itemDetailView = ItemDetailView()
    
    override func loadView() {
        view = itemDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = User.detailKeyWord
        itemDetailView.configureView(url: User.link)
    }
}
