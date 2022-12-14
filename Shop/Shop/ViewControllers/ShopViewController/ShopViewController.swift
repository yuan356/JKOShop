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
import ViewModel

public class ShopViewController: JKSViewController, HasTableView {

    @IBOutlet weak var itemTableView: UITableView!
        
    private var items: [ItemModel] {
        return itemViewModel.items.value ?? []
    }
    
    private let itemViewModel = ItemViewModel()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        title = "ๅๅๅ่กจ"
        itemViewModel.items.bind { [weak self] (items) in
            self?.itemTableView.reloadData()
        }
        itemViewModel.getItems()
        setupTableView()
    }
    
    public func setupTableView() {
        itemTableView.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
        itemTableView.delegate = self
        itemTableView.dataSource = self
        itemTableView.registerCell(type: ItemCell.self, bundle: Bundle(for: type(of: self)))
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
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ItemDetailViewController()
        vc.item = self.items[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
