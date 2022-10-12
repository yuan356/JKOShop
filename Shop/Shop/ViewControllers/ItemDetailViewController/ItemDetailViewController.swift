//
//  ItemDetailViewController.swift
//  Shop
//
//  Created by Will Chen on 2022/10/9.
//

import UIKit
import Models
import ViewModel
import Helper
import Payment

class ItemDetailViewController: JKSViewController {

    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var addCartBtnView: UIView!
    @IBOutlet weak var buyBtnView: UIView!
    
    var item: ItemModel!
    
    var cartViewModel = CartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "商品詳情"
        setupUI()
        setupDetail()
    }
    
    private func setupDetail() {
        itemImage.image = UIImage(named: item.imageUrl)
        titleLabel.text = item.title
        descLabel.text = item.desc
        amountLabel.text = "$\(item.amount.toInt())"
    }
    
    override func setupUI() {
        addCartBtnView.layer.cornerRadius = 5
        buyBtnView.layer.cornerRadius = 5
    }
    
}

// actions
extension ItemDetailViewController {
    
    @IBAction func addToCartClicked(_ sender: Any) {
        cartViewModel.addToCart(item: item)
        let controller = UIAlertController(title: "成功加入購物車", message: item.title, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func buyNowClicked(_ sender: Any) {
        let vc = PaymentViewController()
        vc.cartItems = [CartItemModel(item: item)]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
