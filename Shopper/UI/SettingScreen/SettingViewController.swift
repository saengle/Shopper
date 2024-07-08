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
        settingView.tableView.register(SettingHeaderView.self, forHeaderFooterViewReuseIdentifier: SettingHeaderView.identifier)
        settingView.tableView.sectionHeaderHeight = 120
        settingView.tableView.isScrollEnabled = false
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
        if indexPath.row == 0 {cell.setLikeList(count: UserManager.likeList.count )}
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if settingOptions.allCases[indexPath.row] == settingOptions.myList {
            let vc = LikeViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
        else if settingOptions.allCases[indexPath.row] == settingOptions.withdraw {
            showAlert(title: "탈퇴하기", messeage: "탈퇴를 하면 데이터가 모두 초기화됩니다. 탈퇴하시겠습니까?") { UIAlertAction in
                self.resetDefaults()
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                let sceneDelegate = windowScene?.delegate as? SceneDelegate
                let vc = OnBoardViewController()
                let nvc = UINavigationController(rootViewController: vc)
                sceneDelegate?.window?.rootViewController = nvc   // entrypoint
                sceneDelegate?.window?.makeKeyAndVisible()  //show
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: SettingHeaderView.identifier) as? SettingHeaderView else {return UITableViewHeaderFooterView()}
        header.WholeButton.addTarget(self, action: #selector(setProfileClicked), for: .touchUpInside)
        header.profileImage.isEnabled = true
        if let signDate = UserManager.signInDay {
            header.dateLabel.text = "\(signDate) 가입"
        }
        header.nameLabel.text = UserManager.userName
        header.profileImage.setImage(UIImage(named: UserManager.userProfile), for: .normal)
        return header
    }
}

extension SettingViewController {
    // 화면으로 이동
    @objc private func setProfileClicked() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationController?.pushViewController(SetEditProfileViewController(), animated: true)
    }
    // MARK:  유저디폴츠 데이터 전부 삭제
    private func resetDefaults() {
        UserManager.deleteAllUserData()
    }
}

