//
//  Characters.swift
//  RickAndMortyTestApp
//
//  Created by Eufen Deibe on 01/12/23.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}

struct CharacterResponse: Codable {
    let results: [Character]
}

struct CharacterInfo: Codable {
    let count: Int
    let pages: Int
    let next: URL?
    let prev: URL?
}
