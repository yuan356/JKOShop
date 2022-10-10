//
//  ItemDetailView.swift
//  Payment
//
//  Created by Will Chen on 2022/10/10.
//

import UIKit
import Helper
import Models

class ItemDetailView: XibBaseView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!

    var cartItem: CartItemModel! {
        didSet {
            titleLabel.text = cartItem.item.title
            amountLabel.text = "\(cartItem.totalAmount)"
            countLabel.text = "x\(cartItem.count)"
        }
    }
}
