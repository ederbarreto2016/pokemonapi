//
//  PokemonDetailInteractor.swift
//  PokemonAPI
//
//  Created by Eder Barreto on 15/02/24.
//

import Foundation

protocol PokemonDetailDataStoreProtocol {
    var pokemon: Pokemon? { get set }
}

protocol PokemonDetailInteractorProtocol: PokemonDetailDataStoreProtocol {
    func getPokemonDetail()
}

class PokemonDetailInteractor: PokemonDetailInteractorProtocol {
    
    private let presenter: PokemonDetailPresenterProtocol
    
    var pokemon: Pokemon?

    init(presenter: PokemonDetailPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getPokemonDetail() {
        guard let pokemon = pokemon else { return }
        presenter.showPokemonDetail(pokemon)
    }
}
