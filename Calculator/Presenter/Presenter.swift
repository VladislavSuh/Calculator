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
    
    // MARK: - ViewOutput

    func digitPressed(digitTag: Int, result: String) {
        if result == "0" || interactor.signPressed == true {
            view.setDigits(digit: String(digitTag))
            interactor.signPressed = false
        } else {
            view.setDigits(digit: result + String(digitTag))
        }
    }
    
    // digitTag 10 DotSign
    // digitTag 11 EquelSign
    // digitTag 12 PlusSign
    // digitTag 13 MinusSign
    // digitTag 14 MultiplySign
    // digitTag 15 DivideSign
    // digitTag 16 PercentSign
    // digitTag 17 PlusSlashMinusSign
    // digitTag 18 ResetSign
    func signPressed(digitTag: Int, result: String) {
        switch digitTag {
        case 10:
            if result.contains(".") {
                let dotSing = CharacterSet(charactersIn: ".")
                let labelWithoutDotSign = result.trimmingCharacters(in: dotSing)
                view.setDigits(digit: labelWithoutDotSign)
            } else {
                view.setDigits(digit: result + ".")
            }
        case 11:
            interactor.secondNumber = Double(result)!
            interactor.signPressed = true
            interactor.setNewResult()
        case 12, 13, 14, 15:
            interactor.firstNumber = Double(result)!
            interactor.signPressed = true
            interactor.signTag = digitTag
        case 16:
            interactor.firstNumber = Double(result)!
            interactor.signPressed = true
            interactor.signTag = 16
            interactor.setNewResult()
        case 17:
            if result.contains("-") {
                let minusSing = CharacterSet(charactersIn: "-")
                let labelWithoutMinusSign = result.trimmingCharacters(in: minusSing)
                view.setDigits(digit: labelWithoutMinusSign)
            } else {
                view.setDigits(digit: "-" + result)
            }
        case 18:
            interactor.firstNumber = 0
            interactor.secondNumber = 0
            interactor.signPressed = false
            view.setDigits(digit: "0")
        default: return
        }
    }
    
    // MARK: - InteractorOutput
    
    func didFinishSetNewResult(digit: String) {
        view.setDigits(digit: digit)
        if digit.contains(".0") {
            var resultWithoutDotZero = digit
            let range = digit.index(digit.endIndex, offsetBy: -2)..<digit.endIndex
            resultWithoutDotZero.removeSubrange(range)
            view.setDigits(digit: resultWithoutDotZero)
        }
    }
    
    func alertError() {
        router.showAlert()
    }
}
