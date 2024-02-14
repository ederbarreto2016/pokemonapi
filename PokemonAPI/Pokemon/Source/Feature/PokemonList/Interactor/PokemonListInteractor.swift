//
//  PokemonListInteractor.swift
//  PokemonAPI
//
//  Created by Eder Barreto on 14/02/24.
//

import Foundation

protocol PokemonListInteractorProtocol {
    func getPokemonList()
}

class PokemonListInteractor: PokemonListInteractorProtocol {
    private let worker: PokemonListWorkerProtocol
    private let presenter: PokemonListPresenterProtocol
    
    init(worker: PokemonListWorkerProtocol, presenter: PokemonListPresenterProtocol) {
        self.worker = worker
        self.presenter = presenter
    }
    
    func getPokemonList() {
        worker.getPokemonList { result in
            switch result {
            case .success(let pokemons):
                self.presenter.presentPokemons(pokemons)
            case .failure(let error):
                self.presenter.presentError(error)
            }
        }
    }
}
