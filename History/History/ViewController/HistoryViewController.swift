//
//  HistoryViewController.swift
//  History
//
//  Created by Will Chen on 2022/10/10.
//

import UIKit
import Helper
import ViewModel
import Models

public class HistoryViewController: JKSViewController, HasTableView {

    @IBOutlet weak var historyTableView: UITableView!
    
    var orderViewModel = OrderViewModel()
    
    var orderList: [OrderModel] {
        return orderViewModel.orderList.value ?? []
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        title = "歷史紀錄"
        setupTableView()
        orderViewModel.orderList.bind { [weak self] (orderList) in
            self?.historyTableView.reloadData()
        }
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        orderViewModel.getOrderList()
    }
    
    public func setupTableView() {
        historyTableView.registerCell(type: HistoryCell.self, bundle: Bundle(for: type(of: self)))
        historyTableView.dataSource = self
    }

}

extension HistoryViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTableView.dequeueCell(withType: HistoryCell.self, for: indexPath)
        cell.order = orderList[indexPath.row]
        return cell
    }
}
