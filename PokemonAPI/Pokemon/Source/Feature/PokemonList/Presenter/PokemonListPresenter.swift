//
//  PokemonListPresenter.swift
//  PokemonAPI
//
//  Created by Eder Barreto on 14/02/24.
//

import Foundation

class PokemonListPresenter {
    weak var viewController: PokemonListViewProtocol?
    
    func presentPokemons(_ pokemons: [PokemonResponse]) {
        viewController?.displayPokemons(pokemons)
    }
    
    func presentError(_ error: Error) {
        viewController?.displayError(error.localizedDescription)
    }
}
