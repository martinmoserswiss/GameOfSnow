//
//  RandomUtilTests.swift
//  RandomUtilTests
//
//  Created by Martin Moser on 26.06.16.
//  Copyright © 2016 martinmoser. All rights reserved.
//

import XCTest

class RandomUtilTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIfRandomIntMethodReturnsInt() {
        assert((RandomUtil.getRandomInt(5) as Any) is Int)
    }
    
    func testRandomIntMethod() {
        let random = RandomUtil.getRandomInt(5)
        let high = 5;
        let low = 0;
        
        XCTAssertTrue(high >= random, "Error, random is too high")
        XCTAssertTrue(low <= random, "Error, random is too low")
    }
    
}
