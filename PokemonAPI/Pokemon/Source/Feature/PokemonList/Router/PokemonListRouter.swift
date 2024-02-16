//
//  PokemonListRouter.swift
//  PokemonAPI
//
//  Created by Eder Barreto on 15/02/24.
//

import Foundation

protocol PokemonListRouterLogic {
    func showPokemonDetail()
}

protocol PokemonListDataPassingProtocol {
    var dataStore: PokemonListDataStoreProtocol! { get }
}

final class PokemonListRouter: PokemonListRouterLogic,
                                PokemonListDataPassingProtocol {
    
    weak var viewController: PokemonListViewController!
    
    var dataStore: PokemonListDataStoreProtocol!
    
    func showPokemonDetail() {
        guard let pokemon = dataStore.pokemon else { return }
        let detailView = PokemonDetailFactory.create(pokemon)
        viewController.navigationController?.pushViewController(detailView, animated: true)
    }
}
