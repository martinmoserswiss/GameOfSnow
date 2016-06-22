//
//  snowTests.swift
//  snowTests
//
//  Created by Martin Moser on 20.06.16.
//  Copyright (c) 2016 martinmoser. All rights reserved.
//

import UIKit
import XCTest

class snowTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAplusB() {
        let a = 5
        let b = 10
        let c = a+b
        XCTAssertEqual(c, 15, "Pass")
    }
    
}
