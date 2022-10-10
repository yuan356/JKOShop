//
//  JKSTabBarViewController.swift
//  JKOShop_willchen
//
//  Created by Will Chen on 2022/10/8.
//

import UIKit
import Shop
import Cart
import History

class JKSTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let shopVC = UINavigationController(rootViewController: ShopViewController())
        let shopBarItem = UITabBarItem(title: "商品列表", image: UIImage(systemName: "gift"), selectedImage: UIImage(named: "gift.fill"))
        shopVC.tabBarItem = shopBarItem
        
        let cartVC = UINavigationController(rootViewController: CartViewController())
        let cartBarItem = UITabBarItem(title: "購物車", image: UIImage(systemName: "cart"), selectedImage: UIImage(named: "cart.fill"))
        cartVC.tabBarItem = cartBarItem
        
        let historyVC = UINavigationController(rootViewController: HistoryViewController())
        let historyBarItem = UITabBarItem(title: "歷史紀錄", image: UIImage(systemName: "clock"), selectedImage: UIImage(named: "clock.fill"))
        historyVC.tabBarItem = historyBarItem
        
        self.tabBar.tintColor = UIColor(named: "JKORed")
        self.viewControllers = [shopVC, cartVC, historyVC]
    }
}
