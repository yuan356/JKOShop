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
    @IBOutlet weak var innerView: UIView!
    
    var cartItem: CartItemModel! {
        didSet {
            titleLabel.text = cartItem.item.title
            amountLabel.text = "\(cartItem.totalAmount)"
            countLabel.text = "x\(cartItem.count)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        innerView.layer.cornerRadius = 8
    }
}
