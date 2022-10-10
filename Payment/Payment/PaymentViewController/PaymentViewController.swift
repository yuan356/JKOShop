//
//  PaymentViewController.swift
//  Payment
//
//  Created by Will Chen on 2022/10/9.
//

import UIKit
import Helper
import Models
import Service

public class PaymentViewController: JKSViewController {

    @IBOutlet weak var buyBtn: UIView!
    @IBOutlet weak var itemStackView: UIStackView!
    @IBOutlet weak var amountLabel: UILabel!
    
    public var cartItems: [CartItemModel]!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        title = "結算訂單"
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    public override func setupUI() {
        buyBtn.layer.cornerRadius = 5
        var total = 0
        
        for item in cartItems {
            let view = ItemDetailView()
            view.cartItem = item
            itemStackView.addArrangedSubview(view)
            total += item.totalAmount
        }
        amountLabel.text = "$\(total)"
    }

    @IBAction func buyBtnClicked(_ sender: Any) {
        
        OrderService.shared.createOrder(items: cartItems)
        
        let controller = UIAlertController(title: "成功提交訂單", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }
    
}
