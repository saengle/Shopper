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
    
    lazy var buttonList: [UIButton] = [simButton, dateButton, dscButton, ascButton]
    let simButton = SortButton(title: Sort.sim.rawValue)
    let dateButton = SortButton(title: Sort.date.rawValue)
    let dscButton = SortButton(title: Sort.dsc.rawValue)
    let ascButton = SortButton(title: Sort.asc.rawValue)
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: cvLayout())
    
    func cvLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16 )
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 48) / 2, height: (UIScreen.main.bounds.width - 48) * 5 / 6)
        return layout
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        configureHierachy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchedView {
    func setTotalLabel(total: String) {
        totalLabel.text = "\(total)개의 검색 결과"
    }
    
    private func configureHierachy() {
        [underLine, totalLabel, simButton, dateButton, dscButton, ascButton, collectionView].forEach{self.addSubview($0)}
    }
    private func configureLayout() {
        underLine.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(24)
        }
        
        simButton.snp.makeConstraints { make in
            make.top.equalTo(totalLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(28)
        }
        dateButton.snp.makeConstraints { make in
            make.top.equalTo(simButton.snp.top)
            make.leading.equalTo(simButton.snp.trailing).offset(8)
            make.height.equalTo(28)
        }
        dscButton.snp.makeConstraints { make in
            make.top.equalTo(simButton.snp.top)
            make.leading.equalTo(dateButton.snp.trailing).offset(8)
            make.height.equalTo(28)
        }
        ascButton.snp.makeConstraints { make in
            make.top.equalTo(simButton.snp.top)
            make.leading.equalTo(dscButton.snp.trailing).offset(8)
            make.height.equalTo(28)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(ascButton.snp.bottom).offset(12)
            make.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        
    }
}
