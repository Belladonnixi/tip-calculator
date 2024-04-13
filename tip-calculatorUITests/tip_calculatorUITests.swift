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
        XCTAssertEqual(screen.totalAmountPerPercentLabel.label, "0€")
        XCTAssertEqual(screen.totalBillValueLabel.label, "0€")
        XCTAssertEqual(screen.totalTipValueLabel.label, "0€")
    }
}
