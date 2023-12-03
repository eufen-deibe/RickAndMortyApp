//
//  DetailPresenter.swift
//  RickAndMortyTestApp
//
//  Created by Eufen Deibe on 01/12/23.
//

import Foundation

protocol DetailPresenterProtocol {
    func didLoad()
}

class DetailPresenter: DetailPresenterProtocol {
    
    let view: DetailView
    let viewData: CharacterViewData
    
    init(view: DetailView, viewData: CharacterViewData) {
        self.view = view
        self.viewData = viewData
    }
    
    func didLoad() {
        view.showLoader()
        //Simulando una carga de datos en una aplicacion en tiempo real
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.view.setup(with: self.viewData)
        }
    }
    
}
