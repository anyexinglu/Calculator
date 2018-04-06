//
//  ViewController.swift
//  Calculator
//
//  Created by Yang,Xiayan on 2018/4/5.
//  Copyright © 2018年 Yang,Xiayan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var userIsTypingDigit: Bool = false
    var stackList = [String]()
    
    @IBOutlet weak var display: UILabel!
    @IBAction func pressDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTypingDigit {
            display.text = display.text! + digit
        }
        else {
            display.text = digit
            userIsTypingDigit = true
        }
        print(display.text)
    }
    
    @IBAction func pressOperator(_ sender: UIButton) {
        let displayValue = display.text! + ""
        let operatorChar = sender.currentTitle!

        stackList.append(displayValue)
        stackList.append(operatorChar)
        print(operatorChar, displayValue, stackList)
        userIsTypingDigit = false
    }
    
    @IBAction func pressCompute(_ sender: UIButton) {
        let displayValue = display.text! + ""
        stackList.append(displayValue)
        var execCompute = ""
        var result = ""
        
        if stackList.count >= 1 {
            
            execCompute = "return back \(stackList[0])"
            result = stackList[0]

            if stackList.count == 2 {
                stackList.append(displayValue)
            }
            if stackList.count == 3 {
                execCompute = "\(stackList[0])\(stackList[1] )\(stackList[2])"
                var digit1 = stackList[0]
                var digit2 = stackList[2]
                var operatorChar = stackList[1];
                result = execCompute
                print(execCompute)
                switch operatorChar {
                case "+":
                    result = String(Double(digit1)! + Double(digit2)!)
                case "−":
                    result = String(Double(digit1)! - Double(digit2)!)
                case "×":
                    result = String(Double(digit1)! * Double(digit2)!)
                case "÷":
                    result = String(Double(digit1)! / Double(digit2)!)
                default:
                    break
                }
            }
            
            stackList = []
        }
        display.text = result
        print(execCompute, result, stackList.count)
        print(result)
        userIsTypingDigit = false
    }
}

