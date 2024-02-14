//
//  PokemonListView.swift
//  PokemonAPI
//
//  Created by Eder Barreto on 14/02/24.
//

import Foundation
import UIKit

class PokemonListViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: PokemonListViewCell.self)
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(with pokemon: Pokemon) {
        nameLabel.text = pokemon.name
    }
    
    private func addSubviews() {
        contentView.addSubview(nameLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
