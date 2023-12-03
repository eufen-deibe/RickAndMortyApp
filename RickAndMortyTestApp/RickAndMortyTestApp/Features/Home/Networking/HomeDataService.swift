//
//  HomeDataService.swift
//  RickAndMortyTestApp
//
//  Created by Eufen Deibe on 01/12/23.
//

import Foundation
import Alamofire

class HomeDataService {
    
    func fetchData(completion: @escaping (CharacterResponse?, String?) -> Void) {
        
        AF.request("https://rickandmortyapi.com/api/character").responseDecodable(of: CharacterResponse.self, completionHandler: { result in
            completion(result.value, result.error?.errorDescription)
        })
    }
}
