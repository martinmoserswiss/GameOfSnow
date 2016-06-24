//
//  TrickDrawerTests.swift
//  TrickDrawerTests
//
//  Created by Martin Moser on 24.06.16.
//  Copyright © 2016 martinmoser. All rights reserved.
//

import XCTest

class TrickDrawerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIfTrickDrawerExists() {
        let trickDrawer = TrickDrawer()
        XCTAssertNotNil(trickDrawer)
    }
    
    func testIfTrickDrawerReturnsInt() {
        let trickDrawer = TrickDrawer()
        assert((trickDrawer.drawTrick() as Any) is Int)
    }
    
}
