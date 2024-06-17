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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingView.tableView.reloadData()
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
        if indexPath.row == 0 {cell.setLikeList(count: User.likeList.count )}
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if settingOptions.allCases[indexPath.row] == settingOptions.withdraw {
            resetDefaults()
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            // 씬 딜리게이트 파일에 접근 ( 씬 딜리게이트 파일 안에 들어가면 윈도우를 찾아 올 수 있음.)
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            let vc = OnBoardViewController()
            let nvc = UINavigationController(rootViewController: vc)
            sceneDelegate?.window?.rootViewController = nvc   // entrypoint
            sceneDelegate?.window?.makeKeyAndVisible()  //show
        }
    }
    
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        <#code#>
//    }
    
}

extension SettingViewController {
    // MARK:  유저디폴츠 데이터 전부 삭제
    private func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}

