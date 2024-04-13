//
//  CalculatorScreen.swift
//  tip-calculatorUITests
//
//  Created by Jessi on 13.04.24.
//

import XCTest

class CalculatorScreen {
    
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    //LogoView
    var logoview: XCUIElement {
        app.otherElements[ScreenIdentifier.LogoView.logoview.rawValue]
    }
    
    // ResultView
    var totalAmountPerPercentLabel: XCUIElement {
        app.staticTexts[ScreenIdentifier.ResultView.totalAmountPerPesonValueLabel.rawValue]
    }
    
    var totalBillValueLabel: XCUIElement {
        app.staticTexts[ScreenIdentifier.ResultView.totalBillValueLabel.rawValue]
    }
    
    var totalTipValueLabel: XCUIElement {
        app.staticTexts[ScreenIdentifier.ResultView.totalTipValueLabel.rawValue]
    }
    
    // BillInputView
    var billInputTextField: XCUIElement {
        app.textFields[ScreenIdentifier.BillInputView.textField.rawValue]
    }
    
    // TipInputView
    var tenPercentTipButton: XCUIElement {
      app.buttons[ScreenIdentifier.TipInputView.tenPercentButton.rawValue]
    }
    
    var fifteenPercentTipButton: XCUIElement {
      app.buttons[ScreenIdentifier.TipInputView.fifteenPercentButton.rawValue]
    }
    
    var twentyPercentTipButton: XCUIElement {
      app.buttons[ScreenIdentifier.TipInputView.twentyPercentButton.rawValue]
    }
    
    var customTipButton: XCUIElement {
      app.buttons[ScreenIdentifier.TipInputView.customTipButton.rawValue]
    }
    
    var customTipAlertTextField: XCUIElement {
      app.textFields[ScreenIdentifier.TipInputView.customTipAlertTextField.rawValue]
    }
    
    // SplitInputView
    var decrementSplitViewButton: XCUIElement {
        app.buttons[ScreenIdentifier.SplitInputView.decrementButton.rawValue]
    }
    
    var incrementSplitViewButton: XCUIElement {
        app.buttons[ScreenIdentifier.SplitInputView.incrementButton.rawValue]
    }
    
    var splitViewQuantityLabel: XCUIElement {
        app.staticTexts[ScreenIdentifier.SplitInputView.quantityLabel.rawValue]
    }
    
    // Actions
    
    func enterBill(amount: Double) {
        billInputTextField.tap()
        billInputTextField.typeText("\(amount)")
    }
    
    func selectTip(tip: Tip) {
        switch tip {
        case .tenPercent:
            tenPercentTipButton.tap()
        case .fifteenPercent:
            fifteenPercentTipButton.tap()
        case .twentyPercent:
            twentyPercentTipButton.tap()
        case .custom(value: let value):
            customTipButton.tap()
            XCTAssert(customTipAlertTextField.waitForExistence(timeout: 1.0))
            customTipAlertTextField.typeText("\(value)")
        }
    }
    
    func selectIncrementButton(numberOfTaps: Int) {
        incrementSplitViewButton.tap(withNumberOfTaps: numberOfTaps, numberOfTouches: 1)
    }
    
    func selectDecrementButton(numberOfTaps: Int) {
        decrementSplitViewButton.tap(withNumberOfTaps: numberOfTaps, numberOfTouches: 1)
    }
    
    func doubleTapLogoView() {
        logoview.tap(withNumberOfTaps: 2, numberOfTouches: 1)
    }
    
    enum Tip {
        case tenPercent
        case fifteenPercent
        case twentyPercent
        case custom(value: Int)
    }
}
