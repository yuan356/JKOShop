//
//  ShopViewController.swift
//  Shop
//
//  Created by Will Chen on 2022/10/8.
//

import UIKit
import Service
import Helper
import Models

public class ShopViewController: UIViewController {

    @IBOutlet weak var itemTableView: UITableView!
    
    private let shopBundle: Bundle = Bundle(for: ShopViewController.self)
    
    private var items: [ItemModel] = []
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        title = "商品列表"
        items = ItemService().getItems()
        setupTableView()
    }
    
    private func setupTableView() {
        itemTableView.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
        itemTableView.delegate = self
        itemTableView.dataSource = self
        itemTableView.registerCell(type: ItemCell.self, bundle: shopBundle)
    }

    public init() {
        super.init(nibName: "ShopViewController", bundle: shopBundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ShopViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTableView.dequeueCell(withType: ItemCell.self, for: indexPath)
        cell.item = items[indexPath.row]
        return cell
    }
}
