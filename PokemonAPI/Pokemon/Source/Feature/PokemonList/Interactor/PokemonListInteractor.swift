//
//  PokemonListInteractor.swift
//  PokemonAPI
//
//  Created by Eder Barreto on 14/02/24.
//

import Foundation

protocol PokemonListDataStoreProtocol {
    var pokemon: Pokemon? { get set }
}

protocol PokemonListInteractorProtocol: PokemonListDataStoreProtocol {
    func getPokemonList()
    func pokemonSelected(at index: Int)
}

class PokemonListInteractor: PokemonListInteractorProtocol {
    
    private var pokemonList = PokemonListResponse(pokemon: [])

    private let worker: PokemonListWorkerProtocol
    private let presenter: PokemonListPresenterProtocol
    
    var pokemon: Pokemon?
    
    init(worker: PokemonListWorkerProtocol, presenter: PokemonListPresenterProtocol) {
        self.worker = worker
        self.presenter = presenter
    }
    
    func pokemonSelected(at index: Int) {
        pokemon = pokemonList.pokemon[index]
    }
    
    func getPokemonList() {
        worker.getPokemonList { result in
            switch result {
            case .success(let pokemons):
                self.pokemonList = pokemons
                self.presenter.presentPokemons(pokemons)
            case .failure(let error):
                self.presenter.presentError(error)
            }
        }
    }
}
