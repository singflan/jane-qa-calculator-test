//
//  JaneCalculatorTests.swift
//  JaneCalculatorTests
//
//  Created by Barlow Tucker on 3/10/17.
//  Copyright © 2017 Jane. All rights reserved.
//

import XCTest
@testable import JaneCalculator

class JaneCalculatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDivide() {
        let calc = Calculator()
        // Test division with ints
        calc.setValue(10)
        calc.calculate(.divide, operand:2)
        
        XCTAssertEqual(5, calc.currentValue)
        
        // Test division with a double & a negative number
        // Will return false until bug is fixed. 
        calc.setValue(-30.5)
        calc.calculate(.divide, operand: 2)
        XCTAssertEqual(-15.25, calc.currentValue)
    }
    
    // test getting a result that contains a decimal
    func testDivideDoubleResult() {
        let calc = Calculator()
        calc.setValue(20)
        calc.calculate(.divide, operand: 8)
        
        XCTAssertEqual(2.5, calc.currentValue)
    }
    
    func testLargeNumberDivide() {
        let calc = Calculator()
        calc.setValue(9223372036854775808) // Int.max plus 1
        calc.calculate(.divide, operand: 100)
        // Test that will fail if number is too big (with program as currently stands)
        XCTAssertGreaterThanOrEqual(Int.max, Int(calc.currentValue))

        // Following test should fail until code is fixed to allow numbers larger than Int.max to be used in division operations.
        XCTAssertEqual(92233720368547758.08, calc.currentValue, "Unable to use such a large number in current format")
}

    func testAddition() {
        let calc = Calculator()
        // simple addition
        calc.setValue(10)
        calc.calculate(.plus, operand: 10)
        
        XCTAssertEqual(20, calc.currentValue)
        
        // negative number & decimal
        calc.setValue(-105)
        calc.calculate(.plus, operand: 17.5)
        
        XCTAssertEqual(-87.5, calc.currentValue)
    }
    
    func testSubtraction() {
        let calc = Calculator()
        calc.setValue(195)
        calc.calculate(.minus, operand: 96)
        
        XCTAssertEqual(99, calc.currentValue)
    }
    
    func testMultiplication() {
        let calc = Calculator()
        calc.setValue(50)
        calc.calculate(.multiple, operand: -5)
        
        XCTAssertEqual(-250, calc.currentValue)
        
        // decimal
        calc.setValue(2.5)
        calc.calculate(.multiple, operand: 2)
        
        XCTAssertEqual(5, calc.currentValue)
    }
    
    func testClear() {
        let calc = Calculator()
        calc.setValue(105.5)
        calc.clear()
        
        XCTAssertEqual(0, calc.currentValue)
    }
    
    func testSetValue() {
        let calc = Calculator()
        let input = Double(arc4random_uniform(1000))
        print(input)
        calc.setValue(input)
        
        XCTAssertEqual(input, calc.currentValue)
    }
}
