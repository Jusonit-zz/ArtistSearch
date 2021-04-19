//
//  ArtistSearchTests.swift
//  ArtistSearchTests
//
//  Created by Rave Bizz on 4/17/21.
//

import XCTest
@testable import ArtistSearch

class ArtistSearchTests: XCTestCase {
    
    var sut: SearchResponse?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let testBundle = Bundle(for: type(of: self))
        if let path = testBundle.path(forResource: "mockData", ofType: "json") {
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) {
                let decoder = JSONDecoder()
                let jResponse = try? decoder.decode(SearchResponse.self, from: jsonData)
                sut = jResponse
            }
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }
    
    func test_DecodeModelFromMockData() {
        guard let sut = sut else {return}
        let artistsArray = sut.results
        XCTAssertEqual(artistsArray?.count, 1, "Artists array should contain 1 entry")
    }
    
    func test_ArtistArrayContainsResultCount() {
        guard let sut = sut else {return}
        let num = sut.resultCount ?? 0
        XCTAssertGreaterThanOrEqual(num, 1)
    }
}
