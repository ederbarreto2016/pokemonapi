//
//  PokemonListPresenter.swift
//  PokemonAPI
//
//  Created by Eder Barreto on 14/02/24.
//

import Foundation

protocol PokemonListPresenterProtocol {
    func presentPokemons(_ pokemons: PokemonListResponse)
    func presentError(_ error: Error)
}

class PokemonListPresenter: PokemonListPresenterProtocol {
    weak var viewController: PokemonListViewProtocol?
    
    func presentPokemons(_ pokemons: PokemonListResponse) {
        viewController?.displayPokemons(pokemons)
    }
    
    func presentError(_ error: Error) {
        viewController?.displayError(error.localizedDescription)
    }
}
