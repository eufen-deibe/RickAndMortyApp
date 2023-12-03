//
//  HomePresenter.swift
//  RickAndMortyTestApp
//
//  Created by Eufen Deibe on 01/12/23.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    func didLoad()
    func retry()
    func didTapSearchBar(with inputText: String)
}

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeView?
    var viewData: [CharacterViewData]?
    let viewDataMapper = CharactersViewDataMapper()
    
    init(view: HomeView) {
        self.view = view
    }
    
    func didLoad() {
        fetchData()
    }
    
    func didTapSearchBar(with inputText: String) {
        handleTapSearchbar(with: inputText)
    }
    
    func fetchData() {
        let service = HomeDataService()
        
        service.fetchData { [weak self] responseData, error in
            guard let responseData = responseData else {
                self?.handleFailure(for: error ?? "")
                return
            }
            self?.handleSuccesfulFetching(for: responseData)
        }
    }
    
    func handleSuccesfulFetching(for charactersData: CharacterResponse) {
        let viewData = viewDataMapper.map(from: charactersData)
        self.viewData = viewData
        view?.setup(with: viewData)
    }
    
    func handleFailure(for error: String) {
        self.view?.showAlert(with: "Se ha producido un error", errorMessage: "Error al obtener los personajes: \(error)")
    }
    
    func retry() {
        fetchData()
    }
    
    func handleTapSearchbar(with inputText: String) {
        guard !inputText.isEmpty, let viewData = viewData else {
            view?.setup(with: viewData ?? [])
            return
        }
        var filteredCharacters: [CharacterViewData] = []
        
        for character in viewData {
            if character.name.lowercased().contains(inputText.lowercased()) { filteredCharacters.append(character)
            }
            
            view?.setup(with: filteredCharacters)
        }
    }
}
