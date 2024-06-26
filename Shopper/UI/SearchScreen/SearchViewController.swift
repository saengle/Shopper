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
    private var mySearchedList: [String] = []
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Shopper \(UserManager.userName)님!"
        mySearchedList = UserManager.searchedList
        searchView.tableView.delegate = self
        searchView.tableView.dataSource = self
        searchView.tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        searchView.searchBar.delegate = self
        searchView.removeButton.addTarget(self, action: #selector(allDeleteClicked), for: .touchUpInside)
        self.noSearchViewState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mySearchedList = UserManager.searchedList
        self.searchView.searchBar.text = ""
        self.noSearchViewState()
        self.searchView.tableView.reloadData()
    }
}
extension SearchViewController {
    private func noSearchViewState() {
        if mySearchedList.count == 0 { searchView.noSearchView.isHidden = false }
        else { searchView.noSearchView.isHidden = true}
    }
    
    @objc private func deleteButtonClicked(_ sender: UIButton) {
        mySearchedList.remove(at: sender.tag)
        UserManager.searchedList = mySearchedList
        noSearchViewState()
        self.searchView.tableView.reloadData()
    }
    
    @objc private func allDeleteClicked() {
        mySearchedList.removeAll()
        UserManager.searchedList = mySearchedList
        noSearchViewState()
        self.searchView.tableView.reloadData()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        let vc = SearchedViewController()
        UserManager.keyWord = searchBar.text!
        if mySearchedList.contains(searchBar.text!) == false {
            mySearchedList.insert((searchBar.text!), at: 0)
            UserManager.searchedList = mySearchedList
        }
        self.navigationController?.pushViewController((vc), animated: true)
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySearchedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        cell.removeButton.tag = indexPath.row
        cell.removeButton.addTarget(self, action: #selector(deleteButtonClicked), for: .touchUpInside)
        cell.configureCell(title: mySearchedList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        let vc = SearchedViewController()
        UserManager.keyWord = mySearchedList[indexPath.row]
        self.navigationController?.pushViewController((vc), animated: true)
    }
}
