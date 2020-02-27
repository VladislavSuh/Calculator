//
//  Router.swift
//  Calculator
//
//  Created by Владислав on 18/02/2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation
import UIKit

class Router: RouterInput {
    
    // MARK: - Instance Properties
    
    weak var view: UIViewController!
    
    // MARK: - RouterInput
    
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Starina poshel ka ti naxuj so svoim deleniem na 0", preferredStyle: .alert)
        let action = UIAlertAction(title: "Pojti naxuj", style: .default, handler: nil)
        alert.addAction(action)
        view.present(alert, animated: true, completion: nil)
    }
}
