//
//  ItemCell.swift
//  Shop
//
//  Created by Will Chen on 2022/10/9.
//

import UIKit
import Models

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var innerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var descLabel: UILabel!
    
    var item: ItemModel! {
        didSet {
            titleLabel.text = item.title
            itemImage.image = UIImage(named: item.imageUrl)
            amountLabel.text = "$\(item.amount.toInt())"
            descLabel.text = item.desc
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        innerView.layer.cornerRadius = 8
        // Initialization code
    }
    
}
