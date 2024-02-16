//
//  PokemonDetailViewController.swift
//  PokemonAPI
//
//  Created by Eder Barreto on 15/02/24.
//

import UIKit

protocol PokemonDetailViewProtocol: AnyObject {
    func displayPokemonDetail(_ pokemon: Pokemon)
}

class PokemonDetailViewController: UIViewController {
    
    var interactor: PokemonDetailInteractorProtocol?
    
    private var pokemonDetailView: PokemonDetailView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .white
        interactor?.getPokemonDetail()
    }
    
    func setupViews() {
        pokemonDetailView = PokemonDetailView()
        view.addSubview(pokemonDetailView)
        pokemonDetailView.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            pokemonDetailView.topAnchor.constraint(equalTo: view.topAnchor),
            pokemonDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pokemonDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pokemonDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension PokemonDetailViewController: PokemonDetailViewProtocol {
    func displayPokemonDetail(_ pokemon: Pokemon) {
        pokemonDetailView.configure(pokemon)
    }
}
