//
//  JKSViewController.swift
//  Helper
//
//  Created by Will Chen on 2022/10/9.
//

import UIKit

public protocol HasTableView {
    func setupTableView()
}

open class JKSViewController: UIViewController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
    }
    
    open func setupUI() {}
    
    open func setupViewModel() {}
    
    public init() {
        super.init(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
