//
//  Presenter.swift
//  Calculator
//
//  Created by Владислав on 18/02/2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation

class Presenter: ViewOutput, InteractorOutput {
    
    // MARK: - Instance Properties 
    
    weak var view: ViewInput!
    var interactor: InteractorInput!
    var router: RouterInput!
    
    // MARK: ViewOutput
    // Methods
    func digitPressed(digitTag: Int, resultLabel: String) {
        if resultLabel == "0" || interactor.signPressed == true {
            view.setDigits(digit: String(digitTag))
            interactor.signPressed = false
        } else {
            view.setDigits(digit: resultLabel + String(digitTag))
        }
    }
    
    func signPressed(digitTag: Int, resultLabel: String) {
        switch digitTag {
        case 10: // DotSing
            if resultLabel.contains(".") {
                let dotSing = CharacterSet(charactersIn: ".")
                let labelWithoutDotSign = resultLabel.trimmingCharacters(in: dotSing)
                view.setDigits(digit: labelWithoutDotSign)
            } else {
                view.setDigits(digit: resultLabel + ".")
            }
        case 11: // EquelSign
            interactor.secondNumber = Double(resultLabel)!
            interactor.setNewResult()
            interactor.signPressed = true
            interactor.setNewResult() 
        case 12: // PlusSign
         interactor.firstNumber = Double(resultLabel)!
            interactor.signPressed = true
            interactor.signTag = 12
        case 13: // MinusSign
            interactor.firstNumber = Double(resultLabel)!
            interactor.signPressed = true
            interactor.signTag = 13
        case 14: // MultiplySign
            interactor.firstNumber = Double(resultLabel)!
            interactor.signPressed = true
            interactor.signTag = 14
        case 15: // DivideSign
            interactor.firstNumber = Double(resultLabel)!
            interactor.signPressed = true
            interactor.signTag = 15
        case 16: // PercentSign
            interactor.firstNumber = Double(resultLabel)!
            interactor.signPressed = true
            interactor.signTag = 16
            interactor.setNewResult()
        case 17: // PlusSlashMinusSign
            if resultLabel.contains("-") {
                let minusSing = CharacterSet(charactersIn: "-")
                let labelWithoutMinusSign = resultLabel.trimmingCharacters(in: minusSing)
                view.setDigits(digit: labelWithoutMinusSign)
            } else {
                view.setDigits(digit: "-" + resultLabel)
            }
        case 18: // ResetSign
            interactor.firstNumber = 0
            interactor.secondNumber = 0
            interactor.signPressed = false
            view.setDigits(digit: "0")
        default: return
        }
    }
    
    // MARK: InteractorOutput
    // Methods
    func didFinishSetNewResult(digit: String) {
        view.setDigits(digit: digit)
        if digit.contains(".0") {
            var resultWithoutDotZero = digit
            let range = digit.index(digit.endIndex, offsetBy: -2)..<digit.endIndex
            resultWithoutDotZero.removeSubrange(range)
            view.setDigits(digit: resultWithoutDotZero)
        }
    }
}
