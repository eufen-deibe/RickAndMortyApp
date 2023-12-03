//
//  DetailBuilder.swift
//  RickAndMortyTestApp
//
//  Created by Eufen Deibe on 01/12/23.
//

import UIKit

class DetailBuilder {
    
    func makeDetailViewController(with selectedData: CharacterViewData) -> UIViewController {
        let viewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
        viewController.presenter = DetailPresenter(view: viewController, viewData: selectedData)
        return viewController
    }
}
