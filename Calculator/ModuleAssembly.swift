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
    
    // MARK: - Instance Methods
    
    func configureModule() {
        guard let view = viewController else { return }
        let router = Router()
        let interactor = Interactor()
        let presenter = Presenter()
        
        presenter.interactor = interactor  
        presenter.router = router
        presenter.view = view
        interactor.interactorOutput = presenter
        router.view = view
        
        view.viewOutput = presenter
    }
    
    // MARK: - Initializers
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureModule()
    }
}
