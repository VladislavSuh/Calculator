//
//  Interactor.swift
//  Calculator
//
//  Created by Владислав on 18/02/2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation

class Interactor: InteractorInput {
    
    // MARK: Instance Properties 
    
    weak var interactorOutput: InteractorOutput!
    
    // MARK: InteractorInput
    // Properties
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var result: Double = 0
    var signPressed = false
    var signTag: Int = 0
    
    // Methods
    func setNewResult() {
        switch signTag {
        case 12: result = firstNumber + secondNumber
        case 13: result = firstNumber - secondNumber
        case 14: result = firstNumber * secondNumber
        case 15: result = firstNumber / secondNumber
        case 16: result = firstNumber / 100
        default: result = secondNumber
        }
        interactorOutput.didFinishSetNewResult(digit: String(result))
    }
}
