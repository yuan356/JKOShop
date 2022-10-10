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

public class CartViewController: JKSViewController, HasTableView {

    @IBOutlet private weak var cartTableView: UITableView!
    @IBOutlet weak var checkoutBtn: UIView!
    private var cartViewModel = CartViewModel()
    
    private var cartItems: [CartItemModel] {
        return cartViewModel.cartItems.value ?? []
    }
    
    private var checkedItemsId: [Int] = []
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        title = "購物車"
        setupTableView()
    }
    
    public override func setupViewModel() {
        cartViewModel.cartItems.bind { [weak self] (cartitems) in
            self?.cartTableView.reloadData()
        }
    }
    
    public override func setupUI() {
        checkoutBtn.layer.cornerRadius = 5
    }
    
    public func setupTableView() {
        cartTableView.registerCell(type: CartItemCell.self, bundle: Bundle(for: type(of: self)))
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        cartViewModel.getCartItems()
    }
    
    @IBAction func checkoutBtnClicked(_ sender: Any) {
    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cartItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTableView.dequeueCell(withType: CartItemCell.self, for: indexPath)
        let cartItem = cartItems[indexPath.row]
        cell.cartItem = cartItem
        cell.itemSelected = checkedItemsId.contains(cartItem.item.id)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cartItemId = cartItems[indexPath.row].item.id
        if let cell = cartTableView.cellForRow(at: indexPath) as? CartItemCell {
            if let i = checkedItemsId.firstIndex(of: cartItemId) {
                checkedItemsId.remove(at: i)
                cell.itemSelected = false
            } else {
                checkedItemsId.append(cartItemId)
                cell.itemSelected = true
            }
        }
    }
    
}
