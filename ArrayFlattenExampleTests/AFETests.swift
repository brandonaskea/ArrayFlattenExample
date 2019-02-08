//
//  AFETests.swift
//  ArrayFlattenExampleTests
//
//  Created by Brandon Askea on 2/7/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import XCTest

class AFETests: XCTestCase {
    
    var flattener:AFEArrayFlattener!
    var randomizer:AFEArrayRandomizer!

    override func setUp() {
        flattener = AFEArrayFlattener()
        randomizer = AFEArrayRandomizer()
    }

    override func tearDown() {
        flattener = nil
        randomizer = nil
    }
    
    func testFlattening() {
        let nestedArray = randomizer.nestedArray()
        XCTAssertGreaterThan(nestedArray.count, 0)
        XCTAssertTrue((nestedArray as Any) is [[Int]])
        
        let flattened = flattener.flatten(array: nestedArray)
        XCTAssertGreaterThan(flattened.count, 0)
        XCTAssertTrue((flattened as Any) is [Int])
    }

}
