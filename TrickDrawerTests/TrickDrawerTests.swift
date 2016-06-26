//
//  TrickDrawerTests.swift
//  TrickDrawerTests
//
//  Created by Martin Moser on 24.06.16.
//  Copyright © 2016 martinmoser. All rights reserved.
//

import XCTest

class TrickDrawerTests: XCTestCase {
    
    var trickDrawer: TrickDrawer!
    
    override func setUp() {
        super.setUp()
        trickDrawer = TrickDrawer()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIfTrickDrawerExists() {
        XCTAssertNotNil(trickDrawer)
    }
    
    func testIfDrawTrickReturnsInt() {
        assert((trickDrawer.drawTrick() as Any) is String)
    }
    
}
