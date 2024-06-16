//
//  SearchedView.swift
//  Shopper
//
//  Created by 쌩 on 6/17/24.
//

import UIKit


class SearchedView: UIView {
    
    let underLine = {
        let v = UIView()
        v.backgroundColor = Resource.MyColors.lightGray
        v.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        return v
    }()
    
    let totalLabel = {
        let lb = UILabel()
        lb.font = Resource.Font.bold13
        lb.textColor = Resource.MyColors.primary
        return lb
    }()
    
    let buttonList: [UIButton] = []
    let simButton = SortButton(title: Sort.sim.rawValue)
    let dateButton = SortButton(title: Sort.date.rawValue)
    let dscButton = SortButton(title: Sort.dsc.rawValue)
    let ascButton = SortButton(title: Sort.asc.rawValue)
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: cvLayout())
    
    func cvLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10 )
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 80)
        return layout
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        configureHierachy()
        configureLayout()
        totalLabel.text = "244,564개의 검색 결과"
//        sortButton.setTitle("정확도", for: .selected)
//        testButton.setTitle("정확도", for: .selected)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchedView {
    
    private func configureHierachy() {
        self.addSubview(underLine)
        self.addSubview(totalLabel)
//        self.addSubview(sortButton)
        self.addSubview(simButton)
        self.addSubview(dateButton)
        self.addSubview(dscButton)
        self.addSubview(ascButton)
    }
    private func configureLayout() {
        underLine.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(24)
        }
        
//        sortButton.snp.makeConstraints { make in
//            make.top.equalTo(totalLabel.snp.bottom).offset(16)
//            make.leading.equalToSuperview().inset(16)
//            make.height.equalTo(24)
//        }
        simButton.snp.makeConstraints { make in
            make.top.equalTo(totalLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(28)
        }
        dateButton.snp.makeConstraints { make in
            make.top.equalTo(totalLabel.snp.bottom).offset(16)
            make.leading.equalTo(simButton.snp.trailing).offset(8)
            make.height.equalTo(28)
        }
        dscButton.snp.makeConstraints { make in
            make.top.equalTo(totalLabel.snp.bottom).offset(16)
            make.leading.equalTo(dateButton.snp.trailing).offset(8)
            make.height.equalTo(28)
        }
        ascButton.snp.makeConstraints { make in
            make.top.equalTo(totalLabel.snp.bottom).offset(16)
            make.leading.equalTo(dscButton.snp.trailing).offset(8)
            make.height.equalTo(28)
        }
        
        
    }
}
