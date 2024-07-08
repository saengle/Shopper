//
//  LikeView.swift
//  Shopper
//
//  Created by 쌩 on 7/9/24.
//

import UIKit

import SnapKit

class LikeView: UIView {
    
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
extension LikeView {
    private func configureHierachy() {
        [collectionView].forEach{self.addSubview($0)}
    }
    private func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
