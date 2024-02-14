//
//  PokemonModel.swift
//  PokemonAPI
//
//  Created by Eder Barreto on 14/02/24.
//

import Foundation

struct PokemonResponse: Decodable {
    let name: String?
    let img: String?
    let height: String?
    let weight: String?
}

enum ErrorType: Swift.Error {
    case businessError(Error)
    case networkError(Error)
}
