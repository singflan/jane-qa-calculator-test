//
//  JaneCalculatorUITests.swift
//  JaneCalculatorUITests
//
//  Created by Barlow Tucker on 3/10/17.
//  Copyright © 2017 Jane. All rights reserved.
//

import XCTest

class JaneCalculatorUITests: XCTestCase {
    
    let app = XCUIApplication()
    let totalNumberLabel = XCUIApplication().staticTexts["totalLabel"]  //.matching(identifier: "totalLabel").element
    let oneButton = XCUIApplication().buttons["1"]
    let twoButton = XCUIApplication().buttons["2"]
    let threeButton = XCUIApplication().buttons["3"]
    let fourButton = XCUIApplication().buttons["4"]
    let fiveButton = XCUIApplication().buttons["5"]
    let sixButton = XCUIApplication().buttons["6"]
    let sevenButton = XCUIApplication().buttons["7"]
    let eightButton = XCUIApplication().buttons["8"]
    let nineButton = XCUIApplication().buttons["9"]
    let zeroButton = XCUIApplication().buttons["0"]
    let addButton = XCUIApplication().buttons["+"]
    let subtractButton = XCUIApplication().buttons["-"]
    let multiplyButton = XCUIApplication().buttons["*"]
    let divideButton = XCUIApplication().buttons["/"]
    let decimalButton = XCUIApplication().buttons["."]
    let clearButton = XCUIApplication().buttons["C"]
    let equalsButton = XCUIApplication().buttons["="]
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func testAllNumberButtons() {
        XCTAssert(totalNumberLabel.exists)
        
        oneButton.tap()
        XCTAssertEqual(Double(1), Double(totalNumberLabel.label))
        twoButton.tap()
        XCTAssertEqual(Double(12), Double(totalNumberLabel.label))
        threeButton.tap()
        XCTAssertEqual(Double(123), Double(totalNumberLabel.label))
        fourButton.tap()
        XCTAssertEqual(Double(1234), Double(totalNumberLabel.label))
        fiveButton.tap()
        XCTAssertEqual(Double(12345), Double(totalNumberLabel.label))
        sixButton.tap()
        XCTAssertEqual(Double(123456), Double(totalNumberLabel.label))
        sevenButton.tap()
        XCTAssertEqual(Double(1234567), Double(totalNumberLabel.label))
        eightButton.tap()
        XCTAssertEqual(Double(12345678), Double(totalNumberLabel.label))
        nineButton.tap()
        XCTAssertEqual(Double(123456789), Double(totalNumberLabel.label))
        zeroButton.tap()
        XCTAssertEqual(Double(1234567890), Double(totalNumberLabel.label))
        
        decimalButton.tap()
        twoButton.tap()
        XCTAssertEqual(Double(1234567890.2), Double(totalNumberLabel.label))
    }
    
    func testClearButton() {
        oneButton.tap()
        threeButton.tap()
        XCTAssertEqual(Double(13), Double(totalNumberLabel.label))
        
        clearButton.tap()
        XCTAssertEqual(Double(0), Double(totalNumberLabel.label))
    }
    
    func testAddButton() {
        XCTAssert(addButton.exists)
        addButton.tap()
        XCTAssertNotEqual("+", String(totalNumberLabel.label))
        // we don't need to reset to zero here since adding our number to zero just returns the number we want
        
        // 2 + 5 = 7
        twoButton.tap()
        addButton.tap()
        fiveButton.tap()
        equalsButton.tap()
        XCTAssertEqual(Double(7), Double(totalNumberLabel.label))
    }
    
    func testSubtractButton() {
        XCTAssert(subtractButton.exists)
        subtractButton.tap()
        XCTAssertNotEqual("-", String(totalNumberLabel.label))
        
        // due to current calculator design, need to press equals after pressing subtract button so we don't subtract the next number from zero.
        equalsButton.tap()
        
        // 10 - 4.5 = 5.5
        oneButton.tap()
        zeroButton.tap()
        subtractButton.tap()
        fourButton.tap()
        decimalButton.tap()
        fiveButton.tap()
        equalsButton.tap()
        XCTAssertEqual(Double(5.5), Double(totalNumberLabel.label))
    }
    
    func testMultiplyButton() {
        XCTAssert(multiplyButton.exists)
        multiplyButton.tap()
        XCTAssertNotEqual("*", String(totalNumberLabel.label))
        
        // due to current calculator design, need to press zero & equals after pressing multiply button so we don't multiply the next number by zero.
        zeroButton.tap()
        equalsButton.tap()
        
        // 11 * 5 = 55
        oneButton.tap()
        oneButton.tap()
        multiplyButton.tap()
        fiveButton.tap()
        equalsButton.tap()
        XCTAssertEqual(Double(55), Double(totalNumberLabel.label))
    }
    
    func testDivideButton() {
        XCTAssert(divideButton.exists)
        divideButton.tap()
        XCTAssertNotEqual("/", String(totalNumberLabel.label))
        
        // due to current calculator design, need to press '+' & equals after pressing divide button so we don't divide the next number by zero and cause a crash
        addButton.tap()
        equalsButton.tap()
        
        // 100 / 5 = 20
        oneButton.tap()
        zeroButton.tap()
        zeroButton.tap()
        divideButton.tap()
        fiveButton.tap()
        equalsButton.tap()
        XCTAssertEqual(Double(20), Double(totalNumberLabel.label))
        
        // Testing current functionality. TODO: Change this test when bug is fixed to divide by doubles
        // For now expecting 20 / 9 = 2.0 since dividend & divisor are rounded to the nearest integer before the transaction is performed
        clearButton.tap()
        twoButton.tap()
        zeroButton.tap()
        divideButton.tap()
        nineButton.tap()
        equalsButton.tap()
        XCTAssertEqual(Double(2.0), Double(totalNumberLabel.label))
    }
    
    func testAdditionAndSubtractionChaining() {
        // 5 + 9 - 10 + 1 - 50.5 = -45.5
        fiveButton.tap()
        addButton.tap()
        nineButton.tap()
        subtractButton.tap()
        oneButton.tap()
        zeroButton.tap()
        addButton.tap()
        oneButton.tap()
        subtractButton.tap()
        fiveButton.tap()
        zeroButton.tap()
        decimalButton.tap()
        fiveButton.tap()
        equalsButton.tap()
        XCTAssertEqual(Double(-45.5), Double(totalNumberLabel.label))
    }
    
    func testMultiplyChaining() {
        // 6 * 2.2 * 3 = 39.6
        sixButton.tap()
        multiplyButton.tap()
        twoButton.tap()
        decimalButton.tap()
        twoButton.tap()
        multiplyButton.tap()
        threeButton.tap()
        equalsButton.tap()
        XCTAssertEqual(Double(39.6), Double(totalNumberLabel.label))
    }
  
    func testUsingClearToChain() {
        // Pressing clear will clear current value but will chain from where at
        // 5 + 2 = 7  then 'C' & then - 3 will equal 4
        fiveButton.tap()
        addButton.tap()
        twoButton.tap()
        equalsButton.tap()
        XCTAssertEqual(Double(7), Double(totalNumberLabel.label))
        clearButton.tap()
        subtractButton.tap()
        threeButton.tap()
        equalsButton.tap()
        XCTAssertEqual(Double(4), Double(totalNumberLabel.label))
        
        // this time will do 3 + 6 C * 5 and it will equal 15 since the 6 was cleared
        threeButton.tap()
        addButton.tap()
        sixButton.tap()
        clearButton.tap()
        multiplyButton.tap()
        fiveButton.tap()
        equalsButton.tap()
        XCTAssertEqual(Double(15), Double(totalNumberLabel.label))
    }
}
