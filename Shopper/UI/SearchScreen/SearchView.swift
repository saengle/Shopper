//
//  SearchView.swift
//  Shopper
//
//  Created by 쌩 on 6/15/24.
//

import UIKit

import SnapKit

class SearchView: UIView {
    let searchBar = {
        let sb = UISearchBar()
        sb.placeholder = "브랜드, 상품 등을 입력하세요."
        return sb
    }()
    
    let noSearchView = {
        let v = UIView()
        v.backgroundColor = Resource.MyColors.white
        let iv = UIImageView()
        v.addSubview(iv)
        iv.image = UIImage(named: "empty")
        iv.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(v.snp.centerY).offset(-100)
        }
        let lb = UILabel()
        v.addSubview(lb)
        lb.text = "최근 검색어가 없어요"
        lb.snp.makeConstraints { make in
            make.top.equalTo(iv.snp.bottom)
            make.centerX.equalToSuperview()
        }
        return v
    }()
    
    let underLine = {
        let v = UIView()
        v.backgroundColor = Resource.MyColors.lightGray
        v.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        return v
    }()
    
    let recentSearchLabel = {
        let lb = UILabel()
        lb.text = "최근 검색"
        lb.font = Resource.Font.bold15
        return lb
    }()
    let removeButton = {
        let bt = UIButton()
        bt.setTitle("전체 삭제", for: .normal)
        bt.setTitleColor(Resource.MyColors.primary, for: .normal)
        bt.tintColor = Resource.MyColors.primary
        bt.titleLabel?.font = Resource.Font.normal13
        return bt
    }()
    let tableView = {
        let tb = UITableView()
        return tb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        configureHierachy()
        configureLayout()
        noSearchView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchView {
    private func configureHierachy() {
        self.addSubview(searchBar)
        self.addSubview(underLine)
        self.addSubview(noSearchView)
        self.addSubview(tableView)
        self.addSubview(recentSearchLabel)
        self.addSubview(removeButton)
        
    }
    private func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        underLine.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview()
        }
        
        recentSearchLabel.snp.makeConstraints { make in
            make.top.equalTo(underLine).offset(8)
            make.leading.equalTo(self.safeAreaLayoutGuide).inset(16)
        }
        removeButton.snp.makeConstraints { make in
            make.top.equalTo(underLine).offset(8)
            make.trailing.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.centerY.equalTo(recentSearchLabel)
        }
        
        noSearchView.snp.makeConstraints { make in
            make.top.equalTo(removeButton.snp.bottom).offset(8)
            make.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(removeButton.snp.bottom).offset(8)
            make.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        
    }
}
