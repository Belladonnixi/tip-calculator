//
//  UIResponder+Extension.swift
//  tip-calculator
//
//  Created by Jessi on 11.04.24.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
