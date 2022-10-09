//
//  CartItemCell.swift
//  Cart
//
//  Created by Will Chen on 2022/10/9.
//

import UIKit
import Models

class CartItemCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet private weak var innerView: UIView!
    
    
    var cartItem: CartItemModel! {
        didSet {
            titleLabel.text = cartItem.item.title
            amountLabel.text = "$\(cartItem.item.amount.toInt())"
            itemImage.image = UIImage(named: cartItem.item.imageUrl)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        innerView.layer.cornerRadius = 8
    }
    
}
