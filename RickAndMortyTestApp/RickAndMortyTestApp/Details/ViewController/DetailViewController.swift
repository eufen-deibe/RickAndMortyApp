//
//  DetailViewController.swift
//  RickAndMortyTestApp
//
//  Created by Eufen Deibe on 01/12/23.
//

import UIKit
import Alamofire
import AlamofireImage

protocol DetailView: AnyObject {
    func setup(with viewData: CharacterViewData)
    func showLoader()
    func hideLoader()
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    private var loaderView: UIActivityIndicatorView!
    var presenter: DetailPresenterProtocol?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.didLoad()
    }
    
}

extension DetailViewController: DetailView {
    
    func showLoader() {
        loaderView = UIActivityIndicatorView(style: .large)
        loaderView.color = .gray
        loaderView.center = view.center
        view.addSubview(loaderView)
        loaderView.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    func hideLoader() {
        loaderView?.stopAnimating()
        view.isUserInteractionEnabled = true
    }
    
    func setup(with selectedData: CharacterViewData) {
        //Cacheo de imagenes
        AF.request(selectedData.image).responseImage(completionHandler: { result in
            self.imageView?.image = result.value
        })
        
        self.nameLabel?.text = "Name: \(selectedData.name)"
        self.statusLabel?.text = "Status: \(selectedData.status)"
        self.genderLabel?.text = "Gender: \(selectedData.gender)"
        self.hideLoader()
    }
}
