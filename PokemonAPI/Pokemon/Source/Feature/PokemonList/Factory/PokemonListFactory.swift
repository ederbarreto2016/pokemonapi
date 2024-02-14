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
        let interactor = PokemonListInteractor(worker: worker, presenter: presenter)
        let viewController = PokemonListViewController()
        viewController.interactor = interactor
        presenter.viewController = viewController
    
        return viewController
    }
}
