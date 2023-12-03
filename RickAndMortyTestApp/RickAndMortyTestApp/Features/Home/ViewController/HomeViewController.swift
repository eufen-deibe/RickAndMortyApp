//
//  HomeViewController.swift
//  RickAndMortyTestApp
//
//  Created by Eufen Deibe on 01/12/23.
//

import UIKit
import Alamofire
import AlamofireImage

protocol HomeView: AnyObject {
    func setup(with viewData: [CharacterViewData])
    func showAlert(with title: String, errorMessage: String)
}

public class HomeViewController: UIViewController {
    
    var tableItems: [CharacterViewData?] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresenterProtocol?
    var detailPresenter: DetailPresenterProtocol?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        presenter = HomePresenter(view: self)
        
        presenter?.didLoad()
    
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cellIdentifier")
    }
    
}

extension HomeViewController: HomeView {
    
    func setup(with viewData: [CharacterViewData]) {
        tableItems = viewData
        tableView.reloadData()
    }
    
    func showAlert(with title: String, errorMessage: String) {
        let alertController = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            alertController.dismiss(animated: true)
        }
        let retryAction = UIAlertAction(title: "Retry", style: .default) { (_) in
            self.presenter?.retry()
        }
        
        alertController.addAction(okAction)
        alertController.addAction(retryAction)
        alertController.preferredAction = retryAction

        present(alertController, animated: true, completion: nil)
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        handleSearchBarInput()
    }
    
    func handleSearchBarInput() {
        guard let inputText = searchBar.text else { return }
        presenter?.didTapSearchBar(with: inputText)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableItems.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as? TableViewCell else { return  UITableViewCell()}
        
        // Configurar la celda con los datos del personaje correspondiente
        let tableItem = tableItems[indexPath.row]
        cell.titleLabel?.text = tableItem?.name
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRowIndex = indexPath.row

        guard let selectedData = tableItems[selectedRowIndex] else { return }
        
        let detailViewController = DetailBuilder().makeDetailViewController(with: selectedData)

        // Realiza la navegación utilizando el UINavigationController
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
