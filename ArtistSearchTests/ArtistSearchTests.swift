//
//  ArtistSearchTests.swift
//  ArtistSearchTests
//
//  Created by Rave Bizz on 4/17/21.
//

import XCTest
@testable import ArtistSearch

class ArtistSearchTests: XCTestCase {
    
    var sut: Response?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let testBundle = Bundle(for: type(of: self))
        if let path = testBundle.path(forResource: "mockData", ofType: "json") {
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) {
                let decoder = JSONDecoder()
                let jResponse = try? decoder.decode(Response.self, from: jsonData)
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
        XCTAssertEqual(artistsArray.count, 1, "Artists array should contain 1 entry")
    }
    
    func test_ArtistArrayContainsResultCount() {
        guard let sut = sut else {return}
        let num = sut.resultCount
        XCTAssertGreaterThanOrEqual(num, 1)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
