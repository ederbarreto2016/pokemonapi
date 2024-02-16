//
//  PokemonListFactory.swift
//  PokemonAPI
//
//  Created by Eder Barreto on 14/02/24.
//

import Foundation
import UIKit

class PokemonListFactory {
    
    static func create() -> UIViewController {
        let worker = PokemonListWorker()
        let presenter = PokemonListPresenter()
        let router = PokemonListRouter()
        let interactor = PokemonListInteractor(worker: worker, presenter: presenter)
        let viewController = PokemonListViewController()
        viewController.interactor = interactor
        viewController.router = router
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    
        return viewController
    }
}
