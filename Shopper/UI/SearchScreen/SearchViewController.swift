//
//  SearchViewController.swift
//  Shopper
//
//  Created by 쌩 on 6/15/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchView = SearchView()
    let apiManager = ApiManager()
    let likeList: [Int] = [37, 5, 15]
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Shopper Saengle님!"
        searchView.tableView.delegate = self
        searchView.tableView.dataSource = self
        searchView.tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        apiManager.callShoppingRequest(query: "아이폰", sort: "sim") { result in
            switch result{
            case .success(let myShop):
                
                print(myShop.total)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        UserDefaults.standard.setValue(likeList, forKey: "likeList")
//        print(UserDefaults.standard.array(forKey: "likeList"))
    }
    
}
extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    
}
