//
//  XibBaseView.swift
//
//  Created by Will on 2021/6/16.
//

import UIKit

open class XibBaseView: UIView {

    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.initXibView()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initXibView()
    }
}

extension UIView {
    func initXibView() {
        let thisType = type(of: self)
        if let view = Bundle(for: thisType).loadNibNamed(String(describing: thisType.self), owner: self, options: nil)?.first as? UIView {
            self.addSubview(view)
            view.fillSuperview()
        }
    }
}

