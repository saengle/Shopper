//
//  ItemDetailView.swift
//  Shopper
//
//  Created by 쌩 on 6/17/24.
//

import UIKit
import WebKit

import SnapKit

class ItemDetailView: UIView {
    
    let webView = WKWebView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(url: String) {
        self.addSubview(webView)
        
        webView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
