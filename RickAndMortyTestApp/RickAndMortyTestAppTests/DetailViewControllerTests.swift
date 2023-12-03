//
//  DetailViewControllerTests.swift
//  RickAndMortyTestAppTests
//
//  Created by Eufen Deibe on 01/12/23.
//

import XCTest
@testable import RickAndMortyTestApp

final class DetailViewControllerTests: XCTestCase {

    var sut: DetailViewController!
    
    override func setUpWithError() throws {
        sut = DetailViewController()
        _ = sut.view
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_HasImageView() {
        XCTAssertNotNil(sut.imageView)
    }
    
    func test_HasNameLabel() {
        XCTAssertNotNil(sut.nameLabel)
    }
    
    func test_HasGenderLabel() {
        XCTAssertNotNil(sut.genderLabel)
    }
    
    func test_HasStatusLabel() {
        XCTAssertNotNil(sut.statusLabel)
    }

}
