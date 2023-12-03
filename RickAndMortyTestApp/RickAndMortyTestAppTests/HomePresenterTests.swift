//
//  HomePresenterTests.swift
//  RickAndMortyTestAppTests
//
//  Created by Eufen Deibe on 01/12/23.
//

import XCTest
@testable import RickAndMortyTestApp

final class HomePresenterTests: XCTestCase {
    
    var sut: HomePresenter!
    var sutDelegate: HomeMock!
    
    override func setUpWithError() throws {
        sutDelegate = HomeMock()
        sut = HomePresenter(view: sutDelegate)
    }

    override func tearDownWithError() throws {
        sut = nil
        sutDelegate = nil
    }

    func test_HandleTapSearchBar() throws {
        XCTAssertNotNil(sut?.handleTapSearchbar(with: "Rick Sanchez"))
    }
    
    func test_HandleFailure() {
        XCTAssertNotNil(sut.handleFailure(for: "error"))
    }
}

class HomeMock: HomeView {
    func setup(with viewData: [RickAndMortyTestApp.CharacterViewData]) {}
    
    func showAlert(with title: String, errorMessage: String) {}
}
