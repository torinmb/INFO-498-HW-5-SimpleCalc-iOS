//  ViewController.swift
//  SimpleCalc iOS
//
//  Created by blankens on 10/20/15.
//  Copyright © 2015 Adobe. All rights reserved.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var enterButton: UIButton!
    
    var calculation : Double = 0
    var op: String = ""
    var reset: Bool = false
    var counter: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func factorial(n: Double) -> Double {
        return n == 0 ? 1.0 : n * factorial(n-1)
    }
    
    @IBAction func didSelectFunction(sender: UIButton) {
        if sender.titleLabel!.text! != "=" {
            self.calculation = Double(self.display.text!)!
            self.reset = true
        }
        switch sender.titleLabel!.text! {
            case "AC":
                self.display.text! = "0"
                calculation = 0
                op = ""
                self.reset = false
            case "AVG":
                self.op = "AVG"
                counter += 1
                calculation += Double(self.display.text!)!
            case "COUNT":
                self.display.text! = "\(self.display.text!.characters.count)"
                calculation = 0
            case "/":
                self.op = "/"
            case "X":
                self.op = "X"
            case "-":
                self.op = "-"
            case "+":
                self.op = "+"
            case "%":
                self.op = "%"
            case "FACT":
                self.display.text! = "\(factorial(Double(self.display.text!)!))"
                calculation = 0
            case "=":
                let num2 = Double(self.display.text!)!
                var output : Double = 0
                switch self.op {
                    case "AVG":
                        output = (calculation + num2) / Double(counter)
                        counter = 1
                    case "/":
                        output = calculation / num2
                    case "+":
                        output = calculation + num2
                    case "-":
                        output = calculation - num2
                    case "X":
                        output = calculation * num2
                    case "%":
                        output = calculation % num2
                    default:
                        break
                }
                calculation = 0
                self.display.text! = ("\(output)")
            default:
                break
        }
    
    }
    
    @IBAction func didSelectNumber(sender: UIButton) {
        if self.display.text! == "0" {
           self.display.text! = ""
        } else if reset {
            self.display.text! = ""
            self.reset = false
        }
        switch sender.titleLabel!.text! {
            case "0":
               self.display.text! += "0"
            case "1":
                self.display.text! += "1"
            case "2":
                self.display.text! += "2"
            case "3":
                self.display.text! += "3"
            case "4":
                self.display.text! += "4"
            case "5":
                self.display.text! += "5"
            case "6":
                self.display.text! += "6"
            case "7":
                self.display.text! += "7"
            case "8":
                self.display.text! += "8"
            case "9":
                self.display.text! += "9"
            case "0":
                self.display.text! += "0"
            case ".":
                if self.display.text!.rangeOfString(".") == nil {
                    self.display.text! += "."
                }

            default:
                break
        }
    }

}

