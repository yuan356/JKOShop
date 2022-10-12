//
//  historyCell.swift
//  History
//
//  Created by Will Chen on 2022/10/10.
//

import UIKit
import Models

class HistoryCell: UITableViewCell {

    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet private weak var titleStackView: UIStackView!
    
    var order: OrderModel! {
        didSet {
            for view in titleStackView.arrangedSubviews {
                view.removeFromSuperview()
            }
            for item in order.items {
                let titleLabel = UILabel()
                titleLabel.text = item.item.title
                titleStackView.addArrangedSubview(titleLabel)
            }
            amountLabel.text = "$\(order.orderAmount.toInt())"
            dateLabel.text = order.createdTime
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        innerView.layer.cornerRadius = 8
    }
}
