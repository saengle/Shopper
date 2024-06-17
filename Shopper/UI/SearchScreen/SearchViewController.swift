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
    private  var likeList: [Int] = []
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Shopper \(User.userName)님!"
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
        if let list = User.likeList as? [Int] {
            likeList = list
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let list = User.likeList as? [Int] {
            likeList = list
        }
    }
}
extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationController?.pushViewController((SearchedViewController()), animated: true)
    }
    
}
