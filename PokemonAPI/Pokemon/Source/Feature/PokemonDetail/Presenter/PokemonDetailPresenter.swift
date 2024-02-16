//
//  PokemonDetailPresenter.swift
//  PokemonAPI
//
//  Created by Eder Barreto on 15/02/24.
//

import Foundation

protocol PokemonDetailPresenterProtocol {
    func showPokemonDetail(_ pokemon: Pokemon)
}

class PokemonDetailPresenter: PokemonDetailPresenterProtocol {
    
    weak var viewController: PokemonDetailViewProtocol?
    
    func showPokemonDetail(_ pokemon: Pokemon) {
        viewController?.displayPokemonDetail(pokemon)
    }
}
