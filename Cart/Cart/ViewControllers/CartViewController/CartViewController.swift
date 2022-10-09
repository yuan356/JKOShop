//
//  CartViewController.swift
//  Cart
//
//  Created by Will Chen on 2022/10/9.
//

import UIKit
import Models
import ViewModel
import Helper

public class CartViewController: UIViewController {
    
    @IBOutlet private weak var cartTableView: UITableView!
    
    private var cartViewModel = CartViewModel()
    
    private var cartItems: [CartItemModel] {
        return cartViewModel.cartItems.value ?? []
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        cartTableView.registerCell(type: CartItemCell.self, bundle: Bundle(for: type(of: self)))
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        cartViewModel.cartItems.bind { [weak self] (cartitems) in
            self?.cartTableView.reloadData()
        }
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        cartViewModel.getCartItems()
    }
    
    public init() {
        super.init(nibName: String(describing: CartViewController.self), bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cartItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTableView.dequeueCell(withType: CartItemCell.self, for: indexPath)
        cell.cartItem = cartItems[indexPath.row]
        return cell
    }
    
}
