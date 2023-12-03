//
//  HomeBuilder.swift
//  RickAndMortyTestApp
//
//  Created by Eufen Deibe on 01/12/23.
//

import UIKit

class HomeBuilder {
    
    func makeMainViewController() -> UIViewController {
        let viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        return viewController
    }
}
