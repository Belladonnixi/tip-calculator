//
//  ScreenIdentifier.swift
//  tip-calculator
//
//  Created by Jessi on 13.04.24.
//

import Foundation

enum ScreenIdentifier {
    
    enum LogoView: String {
        case logoview
    }
    
    enum ResultView: String {
        case totalAmountPerPesonValueLabel
        case totalBillValueLabel
        case totalTipValueLabel
    }
    
    enum BillInputView: String {
        case textField
    }
    
    enum TipInputView: String {
        case tenPercentButton
        case fifteenPercentButton
        case twentyPercentButton
        case customTipButton
        case customTipAlertTextField
    }
    
    enum SplitInputView: String {
        case decrementButton
        case incrementButton
        case quantityLabel
    }
}
