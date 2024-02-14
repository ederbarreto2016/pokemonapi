//
//  PokemonListViewController.swift
//  PokemonAPI
//
//  Created by Eder Barreto on 14/02/24.
//

import UIKit

protocol PokemonListViewProtocol: AnyObject {
    func displayPokemons(_ pokemons: [PokemonResponse])
    func displayError(_ message: String)
}

class PokemonListViewController: UIViewController {
    
    var interactor: PokemonListInteractorProtocol?
    var pokemons: [PokemonResponse] = []
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PokemonListViewCell.self, forCellWithReuseIdentifier: "PokemonCell")
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchData()
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func fetchData() {
        interactor?.getPokemonList()
    }
}

extension PokemonListViewController: UICollectionViewDataSource,
                                     UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as? PokemonListViewCell else {
            return UICollectionViewCell()
        }
        let pokemon = pokemons[indexPath.item]
        cell.configureView(with: pokemon)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 20, height: 100)
    }
}

extension PokemonListViewController: PokemonListViewProtocol {
    func displayPokemons(_ pokemons: [PokemonResponse]) {
        self.pokemons = pokemons
        collectionView.reloadData()
    }
    
    func displayError(_ message: String) {
        
    }
}
