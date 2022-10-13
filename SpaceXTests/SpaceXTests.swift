//
//  SpaceXTests.swift
//  SpaceXTests
//
//  Created by Gayatriben Patel on 10/13/22.
//

import XCTest
@testable import SpaceX

class SpaceXTests: XCTestCase {
    
    var launchData : [launch]?
    override func setUp() {
        super.setUp()
        
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        launchData = nil
    }
    
    func testLaunchdataIsNotNil(){
        XCTAssertNotNil(launchData)
    }
    
    func testCountNumberOfData(){
        XCTAssertEqual(2, launchData?.count)
    }
    
    func testDateISreturningInMM_DD_YYYY()
    {
        let date = dateFormattedString (string: launchData?[0].launchDateLocal ?? "")
        XCTAssertEqual("03/24/2006", date)
    }
    
    func getMockData(){
        let decoder = JSONDecoder()
        let bundle = Bundle(for: type(of: self))
        if let url = bundle.url(forResource: "Launch", withExtension: "json")
        {
            do {
                let json = try Data(contentsOf: url)
                let data = try decoder.decode([launch].self, from: json)
                launchData = data
            }
            catch {
                print("unable to process json")
            }
        }
    }
    
}
