//
//  OnBoardViewController.swift
//  Shopper
//
//  Created by 쌩 on 6/13/24.
//

import UIKit

class OnBoardViewController: UIViewController {
   
    let onBoardView = OnBoardView()
   
    override func loadView() {
        view = onBoardView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addTargetButton()
    }
    private func addTargetButton() {
        onBoardView.startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
    }
    
    @objc func startButtonClicked() {
        print("안녕디지몬")
    }
}
