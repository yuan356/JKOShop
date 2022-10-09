//
//  UITableView+reuseCell.swift
//  Extension
//
//  Created by Will Chen on 2022/10/9.
//

import UIKit

public extension UITableView {
    func registerCell<T: UITableViewCell>(type: T.Type, bundle: Bundle? = nil) {
        let cellId = String(describing: type)
        let nib = UINib(nibName: cellId, bundle: bundle)
        register(nib, forCellReuseIdentifier: cellId)
    }
    
    func registerCell(types: [UITableViewCell.Type], bundle: Bundle? = nil) {
        types.forEach { registerCell(type: $0, bundle: bundle) }
    }
    
    func dequeueCell<T: UITableViewCell>(withType type: T.Type) -> T {
        return dequeueReusableCell(withIdentifier: type.identifier) as! T
    }
    
    func dequeueCell<T: UITableViewCell>(withType type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as! T
    }
}

extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
