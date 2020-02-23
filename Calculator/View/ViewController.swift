//
//  ViewController.swift
//  Calculator
//
//  Created by Владислав on 18/02/2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewInput {
    
    // MARK: Instance Properties
    
    var viewOutput: ViewOutput!
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: Instanse Methods
    
    @IBAction func digitPressed(_ sender: UIButton) {
        viewOutput.digitPressed(digitTag: sender.tag, resultLabel: resultLabel.text!)
    }
    
    @IBAction func signPressed(_ sender: UIButton) {
        viewOutput.signPressed(digitTag: sender.tag, resultLabel: resultLabel.text!)
    }
    
    // MARK: ViewInput
    // Methods
    func setDigits(digit: String) {
        resultLabel.text! = digit 
    }
}

 
