//
//  SearchViewController.swift
//  Shopper
//
//  Created by 쌩 on 6/15/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchView = SearchView()
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Shopper Saengle님!"
        searchView.tableView.delegate = self
        searchView.tableView.dataSource = self
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
