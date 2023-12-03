//
//  CharactersViewData.swift
//  RickAndMortyTestApp
//
//  Created by Eufen Deibe on 01/12/23.
//

import Foundation

class CharactersViewDataMapper {
    func map(from response: CharacterResponse) -> [CharacterViewData] {
        response.results.map({
            return CharacterViewData(id: $0.id,
                                     name: $0.name,
                                     status: $0.status,
                                     gender: $0.gender,
                                     image: $0.image
        )})
    }
}
