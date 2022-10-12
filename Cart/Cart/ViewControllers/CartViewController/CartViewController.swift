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
import Payment

public class CartViewController: JKSViewController, HasTableView {

    @IBOutlet private weak var cartTableView: UITableView!
    @IBOutlet weak var checkoutBtnView: UIView!
    @IBOutlet weak var checkoutButton: UIButton!
    private var cartViewModel = CartViewModel()
    
    private var cartItems: [CartItemModel] {
        get {
            return cartViewModel.cartItems.value ?? []
        }
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
            self?.setButtonStyle()
        }
    }
    
    public override func setupUI() {
        checkoutBtnView.layer.cornerRadius = 5
    }
    
    private func setButtonStyle() {
        let enable = cartItems.count > 0 && checkedItemsId.count > 0
        checkoutBtnView.alpha = enable ? 1 : 0.4
        checkoutButton.isEnabled = enable ? true : false
    }
    
    public func setupTableView() {
        cartTableView.registerCell(type: CartItemCell.self, bundle: Bundle(for: type(of: self)))
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        cartViewModel.getCartItems()
        checkedItemsId.removeAll()
    }
    
    @IBAction func checkoutBtnClicked(_ sender: Any) {
        let orderItems = cartItems.filter { (item) -> Bool in
            return checkedItemsId.contains(item.item.id)
        }
        let vc = PaymentViewController()
        vc.cartItems = orderItems
        self.navigationController?.pushViewController(vc, animated: true)
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
            setButtonStyle()
        }
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
          let item = self.cartItems[indexPath.row]
          if let i = checkedItemsId.firstIndex(of: item.item.id) {
              checkedItemsId.remove(at: i)
          }
          cartViewModel.deleteCartItems(cartItem: item)
          self.cartTableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }
    
}
