//
//  InteractorInput.swift
//  Calculator
//
//  Created by Владислав on 18/02/2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation

protocol InteractorInput: AnyObject {
    
    // Properties
    var firstNumber: Double { get set}
    var secondNumber: Double { get set}
    var signTag: Int { get set }
    var result: Double { get set }
    var signPressed: Bool { get set }
    
    // Methods
    func setNewResult()
}
