//
//  TabBarController.swift
//  Shopper
//
//  Created by 쌩 on 6/17/24.
//

import UIKit

class TabbarController: UITabBarController {
    // 결국 뷰컨을 상속 받아있어서 뷰컨의 뷰디드로드 사용 가능.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = Resource.MyColors.primary
        tabBar.unselectedItemTintColor = Resource.MyColors.lightGray
        
        
        let search = SearchViewController()
        let nav1 = UINavigationController(rootViewController: search)
        nav1.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        
        let setting = SettingViewController()
        let nav2 = UINavigationController(rootViewController: setting)
        nav2.tabBarItem = UITabBarItem(title: "설정", image: UIImage(systemName: "person"), tag: 1)
        
        setViewControllers([nav1, nav2], animated: true)
        
        
    }
    
}



