//
//  UIView+anchors.swift
//  Helper
//
//  Created by Will Chen on 2022/10/10.
//

import UIKit

extension UIView {

    func fillSuperview(padding: UIEdgeInsets) {
        anchor(top: superview?.topAnchor, bottom: superview?.bottomAnchor, leading: superview?.leadingAnchor,  trailing: superview?.trailingAnchor, padding: padding)
    }
    
    func fillSuperview() {
        fillSuperview(padding: .zero)
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?,  trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func anchorSize(h: CGFloat = 0, w: CGFloat = 0) {
        if h != 0 {
            heightAnchor.constraint(equalToConstant: h).isActive = true
        }
        
        if w != 0 {
            widthAnchor.constraint(equalToConstant: w).isActive = true
        }
    }
    
    func anchorSize(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func centerInSuperView() {
        translatesAutoresizingMaskIntoConstraints = false
        if let x = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: x).isActive = true
        }
        if let y = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: y).isActive = true
        }
    }
    
    func addFillSubview(_ view: UIView) {
        self.addSubview(view)
        view.fillSuperview()
    }

}
