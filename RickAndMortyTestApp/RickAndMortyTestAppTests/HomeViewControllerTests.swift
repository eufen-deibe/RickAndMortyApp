//
//  HomeViewControllerTests.swift
//  RickAndMortyTestAppTests
//
//  Created by Eufen Deibe on 01/12/23.
//

import XCTest
@testable import RickAndMortyTestApp

final class HomeViewControllerTests: XCTestCase {

    var sut: HomeViewController!
    
    override func setUpWithError() throws {
        sut = HomeViewController()
        _ = sut.view
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_HasSearchBar() {
        XCTAssertNotNil(sut.searchBar)
    }
    
    func test_HasTableView() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_HaveSearchbBarDelegate() {
        XCTAssertNotNil(self.sut.searchBar.delegate)
    }
    
    func test_HaveTableViewDelegate() {
        XCTAssertNotNil(self.sut.tableView.delegate)
    }
    
    func test_ConformsSearchBarProtocol() {
        XCTAssert(sut.conforms(to: UISearchBarDelegate.self))
        XCTAssertTrue(self.sut.responds(to:(#selector(sut.searchBar(_:textDidChange:)))))
    }
    
    func test_ConformsTableViewProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:didSelectRowAt:))))
    }
    
    func test_ConformsDataSourceProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.numberOfSections(in:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
    }
    
    func test_ShowsSearchingResults() {
        sut.tableItems = [CharacterViewData(id: 0, name: "Rick Sanchez", status: "Alive", gender: "Male", image: ""), CharacterViewData(id: 1, name: "Morty Smith", status: "Alive", gender: "Male", image: ""), CharacterViewData(id: 2, name: "Summer Smith", status: "Alive", gender: "Male", image: "")]
        
        sut.searchBar.text = "R"
        sut.handleSearchBarInput()
        XCTAssertEqual(sut.tableItems.count, 1)
        XCTAssertEqual(sut.tableItems[0]?.name, "Rick Sanchez")
        
        sut.searchBar.text = "M"
        sut.handleSearchBarInput()
        XCTAssertEqual(sut.tableItems.count, 1)
        XCTAssertEqual(sut.tableItems[0]?.name, "Morty Smith")
        
        sut.searchBar.text = "S"
        sut.handleSearchBarInput()
        XCTAssertEqual(sut.tableItems.count, 1)
        XCTAssertEqual(sut.tableItems[0]?.name, "Summer Smith")
    }
    
    func test_HasReuseIdentifier() {
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? TableViewCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "cellIdentifier"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    
    func test_TableCellHasCorrectLabelText() {
        let cell0 = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? TableViewCell
        XCTAssertEqual(cell0?.titleLabel.text, "Rick Sanchez")
        
        let cell1 = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as? TableViewCell
        XCTAssertEqual(cell1?.titleLabel.text, "Morty Smith")
        
        let cell2 = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 2, section: 0)) as? TableViewCell
        XCTAssertEqual(cell2?.titleLabel.text, "Summer Smith")
    }

    func test_ShowAlert() {
        XCTAssertNotNil(sut.showAlert(with: "Alerta", errorMessage: "Error"))
    }
}
