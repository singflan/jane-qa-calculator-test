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
        
        
//        divideButton.tap()
//        XCTAssertEqual("/", Double(totalNumberLabel.label))
//        multiplyButton.tap()
//        XCTAssertEqual(Double(1), Double(totalNumberLabel.label))
//        addButton.tap()
//        XCTAssertEqual(Double(1), Double(totalNumberLabel.label))
//        subtractButton.tap()
//        XCTAssertEqual(Double(1), Double(totalNumberLabel.label))
        
        
    }
    
    func testAddButton() {
        
    }
    
    func testSubtractButton() {
        
    }
    
    func testMultiplyButton() {
        
    }
    
    func testDivideButton() {
        
    }
    
    func testClearButton() {
        
    }
    
}
