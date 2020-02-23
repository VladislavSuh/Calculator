//
//  ViewOutput.swift
//  Calculator
//
//  Created by Владислав on 18/02/2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation

protocol ViewOutput: AnyObject {
    
    // Methods
    func digitPressed(digitTag: Int, resultLabel: String)
    
    func signPressed(digitTag: Int, resultLabel: String)
}


