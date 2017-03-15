//
//  ViewController.swift
//  JaneCalculator
//
//  Created by Barlow Tucker on 3/10/17.
//  Copyright © 2017 Jane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var totalLabel: UILabel!
    
    //MARK: - Private Variables
    private var userIsTyping: Bool = true
    private var operandEntered: Bool = false
    private let calc: Calculator = Calculator()
    private var currentOperator: CalOperator?
    private var lastOperand: String = ""
    
    //MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: - IBActions
    @IBAction func numberTapped(_ sender: UIButton) {
        guard let currentValue = self.totalLabel.text else { return }
        guard let value = sender.titleLabel?.text else { return }
        guard currentValue != "0" && self.userIsTyping else {
            self.setNewValue(value)
            self.userIsTyping = true
            return
        }
        
        self.setNewValue(currentValue + value)
        self.userIsTyping = true
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        self.userIsTyping = false
        self.totalLabel.text = "0"
        self.lastOperand = "0"
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let value = sender.titleLabel?.text else { return }
        
        if self.operandEntered && self.userIsTyping {
            self.calculate()
        }
        let op:CalOperator
        
        switch value {
            case "/": op = .divide
            case "*": op = .multiple
            case "+": op = .plus
            case "-": fallthrough
            default: op = .minus
        }
        
        self.currentOperator = op
        self.userIsTyping = false
        self.operandEntered = true
    }
    
    @IBAction func equalsTapped(_ sender: UIButton) {
        self.userIsTyping = false
        self.operandEntered = false
        
        self.calculate()
    }
    
    //MARK: - Private Methods
    private func setNewValue(_ value:String) {
        print("Set value: \(value)")
        self.totalLabel.text = value
        self.lastOperand = value
        
        guard let number:Double = Double(value), !self.operandEntered else { return }
        print("setting")
        self.calc.setValue(number)
    }
    
    private func calculate() {
        guard let currentOperator = self.currentOperator else { return }
        
        self.calc.calculate(currentOperator, operand: Double(self.lastOperand) ?? 0.0)
        self.totalLabel.text = "\(self.calc.currentValue)"
    }
}

