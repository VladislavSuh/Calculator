//
//  ViewController.swift
//  Calculator
//
//  Created by Владислав on 18/02/2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewInput {
    
    // MARK: - Instance Properties
    
    @IBOutlet weak var resultLabel: UILabel!
    var viewOutput: ViewOutput!
    
    // MARK: - Instanse Methods
    
    @IBAction func digitPressed(_ sender: UIButton) {
        guard let resultLabel = resultLabel.text else { return }
        viewOutput.digitPressed(digitTag: sender.tag, result: resultLabel)
    }
    
    @IBAction func signPressed(_ sender: UIButton) {
        guard let resultLabel = resultLabel.text else { return }
        viewOutput.signPressed(digitTag: sender.tag, result: resultLabel)
    }
    
    // MARK: - ViewInput
    
    func setDigits(digit: String) {
        if resultLabel.text != nil {
            resultLabel.text = digit
        }
    }
}

 
