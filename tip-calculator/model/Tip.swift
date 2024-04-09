//
//  Tip.swift
//  tip-calculator
//
//  Created by Jessi on 09.04.24.
//

import Foundation

enum Tip {
    case none
    case tenPercent
    case fifteenPercent
    case twentyPercent
    case custom(vaue: Int)
    
    var stringValue: String {
        switch self {
        case .none:
            return ""
        case .tenPercent:
            return "10%"
        case .fifteenPercent:
            return "15%"
        case .twentyPercent:
            return "20%"
        case .custom(vaue: let value):
            return String(value)
        }
    }
}
