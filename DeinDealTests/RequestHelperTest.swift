//
//  RequestHelperTest.swift
//  DeinDealTests
//
//  Created by Alexandre MONTCUIT on 07/09/2022.
//

import XCTest
@testable import DeinDeal

class RequestHelperTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchCities() async throws {
        let cities = await RequestHelper.fetchCities()
        
        XCTAssertFalse(cities.isEmpty)
    }
    
    func testFetchFoodForCityID() async throws {
        let cityID = "zurich"
        let foods = await RequestHelper.fetchFoodForCityID(cityID)
        
        XCTAssertNotNil(foods)
    }
}
