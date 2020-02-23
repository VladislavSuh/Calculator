//
//  InteractorOutput.swift
//  Calculator
//
//  Created by Владислав on 18/02/2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation

protocol InteractorOutput: AnyObject {
    
    // Methods
    func didFinishSetNewResult(digit: String) 
}
