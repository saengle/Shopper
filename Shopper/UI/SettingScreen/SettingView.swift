//
//  SettingView.swift
//  Shopper
//
//  Created by 쌩 on 6/17/24.
//

import UIKit

import SnapKit

class SettingView: UIView {
    
    let underLine = {
        let v = UIView()
        v.backgroundColor = Resource.MyColors.lightGray
        v.snp.makeConstraints { $0.height.equalTo(1) }
        return v
    }()
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        configureHierachy()
        configureLayout()
    }
    
    private func configureHierachy() {
        [tableView, underLine].forEach{self.addSubview($0)}
    }
    private func configureLayout() {
        underLine.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
        }
        tableView.snp.makeConstraints { $0.edges.equalTo(self.safeAreaLayoutGuide) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
