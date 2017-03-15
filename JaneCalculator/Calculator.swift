//
//  Calculator.swift
//  JaneCalculator
//
//  Created by Barlow Tucker on 3/13/17.
//  Copyright © 2017 Jane. All rights reserved.
//

import Foundation

enum CalOperator:String {
    case plus = "+"
    case minus = "-"
    case divide = "/"
    case multiple = "*"
}

class Calculator {
    private(set) var currentValue: Double = 0
    
    func calculate(_ calOperator:CalOperator, operand:Double) {
        print("\(self.currentValue) \(calOperator) \(operand)")
        switch (calOperator) {
            case .plus: currentValue += operand
            case .minus: currentValue -= operand
            case .divide: currentValue = Double(Int(currentValue) / Int(operand))
            case .multiple: currentValue *= operand
        }
    }
    
    func setValue(_ value:Double) {
        self.currentValue = value
        print(type(of: self.currentValue))
    }
    
    func clear() {
        self.currentValue = 0
    }
}
