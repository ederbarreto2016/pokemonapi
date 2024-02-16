//
//  PokemonDetailFactory.swift
//  PokemonAPI
//
//  Created by Eder Barreto on 15/02/24.
//

import Foundation
import UIKit

class PokemonDetailFactory {
    
    static func create(_ pokemon: Pokemon) -> UIViewController {
        let presenter = PokemonDetailPresenter()
        let interactor = PokemonDetailInteractor(presenter: presenter)
        let viewController = PokemonDetailViewController()
        viewController.interactor = interactor
        interactor.pokemon = pokemon
        presenter.viewController = viewController
        
        return viewController
    }
}
