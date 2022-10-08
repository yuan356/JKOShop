//
//  JKSTabBarViewController.swift
//  JKOShop_willchen
//
//  Created by Will Chen on 2022/10/8.
//

import UIKit
import Shop

class JKSTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let shopVC = ShopViewController()
        let firstBarItem = UITabBarItem(title: "Shop", image: UIImage(systemName: "gift"), selectedImage: UIImage(named: "gift.fill"))
        
        shopVC.tabBarItem = firstBarItem
        
        self.tabBar.tintColor = UIColor(named: "JKORed")
        self.viewControllers = [shopVC]
    }
}
