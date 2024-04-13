//
//  tip_calculatorUITests.swift
//  tip-calculatorUITests
//
//  Created by Jessi on 08.04.24.
//

import XCTest

final class tip_calculatorUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    private var screen: CalculatorScreen {
        CalculatorScreen(app: app)
    }
    
    override func setUp() {
        super.setUp()
        app = .init()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app = nil
    }
    
    func testResultViewDefaultValues() {
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "0€")
        XCTAssertEqual(screen.totalBillValueLabel.label, "0€")
        XCTAssertEqual(screen.totalTipValueLabel.label, "0€")
    }
    
    func testRegularTip() {
      // User enters a $100 bill
      screen.enterBill(amount: 100)
      XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "100€")
      XCTAssertEqual(screen.totalBillValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "100€")
      XCTAssertEqual(screen.totalTipValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "0€")
    
      // User selects 10%
      screen.selectTip(tip: .tenPercent)
      XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "110€")
      XCTAssertEqual(screen.totalBillValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "110€")
      XCTAssertEqual(screen.totalTipValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "10€")

      // User selects 15%
      screen.selectTip(tip: .fifteenPercent)
      XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "115€")
      XCTAssertEqual(screen.totalBillValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "115€")
      XCTAssertEqual(screen.totalTipValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "15€")

      // User selects 20%
      screen.selectTip(tip: .twentyPercent)
      XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "120€")
      XCTAssertEqual(screen.totalBillValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "120€")
      XCTAssertEqual(screen.totalTipValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "20€")

      // User splits the bill by 4
      screen.selectIncrementButton(numberOfTaps: 3)
      XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "30€")
      XCTAssertEqual(screen.totalBillValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "120€")
      XCTAssertEqual(screen.totalTipValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "20€")

      // User splits the bill by 2
      screen.selectDecrementButton(numberOfTaps: 2)
      XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "60€")
      XCTAssertEqual(screen.totalBillValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "120€")
      XCTAssertEqual(screen.totalTipValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "20€")
    }
    
    func testCustomTipAndSplitBillBy2() {
      screen.enterBill(amount: 300)
      screen.selectTip(tip: .custom(value: 200))
      screen.selectIncrementButton(numberOfTaps: 1)
      XCTAssertEqual(screen.totalBillValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "500€")
      XCTAssertEqual(screen.totalTipValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "200€")
      XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "250€")
    }
    
    func testResetButton() {
      screen.enterBill(amount: 300)
      screen.selectTip(tip: .custom(value: 200))
      screen.selectIncrementButton(numberOfTaps: 1)
      screen.doubleTapLogoView()
      XCTAssertEqual(screen.totalBillValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "0€")
      XCTAssertEqual(screen.totalTipValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "0€")
      XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label.replacingOccurrences(of: "\u{00A0}", with: ""), "0€")
      XCTAssertEqual(screen.billInputViewTextField.label, "")
      XCTAssertEqual(screen.splitValueLabel.label, "1")
      XCTAssertEqual(screen.customTipButton.label, "Custom Tip")
    }
}
