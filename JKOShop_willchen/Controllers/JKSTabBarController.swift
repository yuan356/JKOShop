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
        let shopBarItem = UITabBarItem(title: "Shop", image: UIImage(systemName: "gift"), selectedImage: UIImage(named: "gift.fill"))
        shopVC.tabBarItem = shopBarItem
        
        let cartVC = UINavigationController(rootViewController: CartViewController())
        let cartBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), selectedImage: UIImage(named: "cart.fill"))
        cartVC.tabBarItem = cartBarItem
        
        
        self.tabBar.tintColor = UIColor(named: "JKORed")
        self.viewControllers = [shopVC, cartVC]
    }
}
