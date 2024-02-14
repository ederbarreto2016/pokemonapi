//
//  PokemonListWorker.swift
//  PokemonAPI
//
//  Created by Eder Barreto on 14/02/24.
//

import Foundation

protocol PokemonListWorkerProtocol {
    func getPokemonList(completion: @escaping (Result<PokemonResponse, ErrorType>) -> Void)
}

class PokemonListWorker: PokemonListWorkerProtocol {    
    func getPokemonList(completion: @escaping (Result<PokemonResponse, ErrorType>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json")!) { data, _, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.businessError(NSError(domain: "Data not found", code: 404, userInfo: nil))))
                return
            }
            
            do {
                let pokemon = try JSONDecoder().decode(PokemonResponse.self, from: data)
                completion(.success(pokemon))
            } catch {
                completion(.failure(.businessError(error)))
            }
            
        }.resume()
    }
}
