//
//  NYTMostPopularTests.swift
//  NYTMostPopularTests
//
//  Created by Eslam Shaker  on 11/12/18.
//  Copyright © 2018 Eslam Shaker . All rights reserved.
//

import XCTest
@testable import NYTMostPopular

class NYTMostPopularTests: XCTestCase {
    
    func testLoadingHit(){
        
        let expect = expectation(description: "we should get a hit")
        
        APIManager.shared.getHit { (hit, error) in
            XCTAssertNil(error, "api error happened. \(error!.localizedDescription)")
            XCTAssertNotNil(hit, "no hit returned")
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Test timed out. \(error!.localizedDescription)")
        }
    }
   
}
