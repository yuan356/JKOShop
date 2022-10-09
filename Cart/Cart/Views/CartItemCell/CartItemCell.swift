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
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var checkImage: UIImageView!
    
    var cartItem: CartItemModel! {
        didSet {
            titleLabel.text = cartItem.item.title
            amountLabel.text = "$\(cartItem.totalAmount)"
            itemImage.image = UIImage(named: cartItem.item.imageUrl)
            countLabel.text = "x\(cartItem.count)"
        }
    }
    
    var itemSelected: Bool! {
        didSet {
            checkImage.image = itemSelected ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "circle")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        innerView.layer.cornerRadius = 8
    }
}
