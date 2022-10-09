//
//  ItemDetailViewController.swift
//  Shop
//
//  Created by Will Chen on 2022/10/9.
//

import UIKit
import Models

class ItemDetailViewController: UIViewController {

    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var addCartBtnView: UIView!
    @IBOutlet weak var buyBtnView: UIView!
    
    var item: ItemModel!
    
    public init() {
        super.init(nibName: String(describing: ItemDetailViewController.self), bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        amountLabel.text = amountLabel.text
    }
    
    private func setupUI() {
        addCartBtnView.layer.cornerRadius = 5
        buyBtnView.layer.cornerRadius = 5
    }
    
}

// actions
extension ItemDetailViewController {
    
    @IBAction func addToCartClicked(_ sender: Any) {
        
    }
    
    @IBAction func buyNowClicked(_ sender: Any) {
        
    }
    
}