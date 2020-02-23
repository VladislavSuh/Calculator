//
//  ModuleAssembly.swift
//  Calculator
//
//  Created by Владислав on 18/02/2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation
import UIKit

class ModuleAssembly: NSObject {
    
    // MARK: - Instance Properties
    
    @IBOutlet weak var viewController: ViewController!
    
    // MARK: - ViewController 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureModule()
    }
    
    // MARK: - Instance Methods
    
    func configureModule() {
        guard let view = viewController as? ViewController else { return }
        let router = Router()
        let interactor = Interactor()
        let presenter = Presenter()
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController
        view.viewOutput = presenter
        interactor.interactorOutput = presenter
    }
}
