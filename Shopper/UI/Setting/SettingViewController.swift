//
//  SettingViewController.swift
//  Shopper
//
//  Created by 쌩 on 6/17/24.
//

import UIKit

class SettingViewController: UIViewController {
    
    let settingView = SettingView()
    
    override func loadView() {
        view = settingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Setting"
        settingView.tableView.delegate = self
        settingView.tableView.dataSource = self
        settingView.tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        settingView.tableView.rowHeight = 52
    }
    
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
        cell.textLabel?.text = settingOptions.allCases[indexPath.row].rawValue
        // Data - likeList 추가해야함.
        if indexPath.row == 0 {cell.setLikeList()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        <#code#>
    }
    
}
