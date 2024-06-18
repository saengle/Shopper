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
        if indexPath.row == 0 {cell.setLikeList(count: User.likeList.count )}
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if settingOptions.allCases[indexPath.row] == settingOptions.withdraw {
            //1. alert 생성
            let alert = UIAlertController(title: "탈퇴하기", message: "탈퇴를 하면 데이터가 모두 초기화됩니다. 탈퇴 하시겠습니까?", preferredStyle: .alert)
            //2. action 선언 필요시 handler 사용.
            let cancel = UIAlertAction(title: "취소", style: .default)
            let ok = UIAlertAction(title: "확인", style: .destructive, handler: { _ in
                self.resetDefaults()
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                // 씬 딜리게이트 파일에 접근 ( 씬 딜리게이트 파일 안에 들어가면 윈도우를 찾아 올 수 있음.)
                let sceneDelegate = windowScene?.delegate as? SceneDelegate
                let vc = OnBoardViewController()
                let nvc = UINavigationController(rootViewController: vc)
                sceneDelegate?.window?.rootViewController = nvc   // entrypoint
                sceneDelegate?.window?.makeKeyAndVisible()  //show
            })
            //3. alert에 action 등록
            alert.addAction(cancel)
            alert.addAction(ok)
            //4. 띄우기
            present(alert, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: SettingHeaderView.identifier) as? SettingHeaderView else {return UITableViewHeaderFooterView()}
        header.WholeButton.addTarget(self, action: #selector(setProfileClicked), for: .touchUpInside)
        header.profileImage.isEnabled = true
        header.dateLabel.text = "\(User.signInDay) 가입"
        header.nameLabel.text = User.userName
        header.profileImage.setImage(UIImage(named: User.userProfile), for: .normal)
        return header
    }
}

extension SettingViewController {
    // 화면으로 이동
    @objc private func setProfileClicked() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationController?.pushViewController(SetProfileViewController(), animated: true)
    }
    // MARK:  유저디폴츠 데이터 전부 삭제
    private func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}

