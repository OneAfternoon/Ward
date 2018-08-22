//
//  WardTests.swift
//  WardTests
//
//  Created by Mack Hasz and Swain Molster on 8/16/18.
//  Copyright © 2018 Mack Hasz and Swain Molster. All rights reserved.
//

import XCTest
@testable import Ward

class WardTests: XCTestCase {
    
    func testGenericInAndOut() {
        var sample: SampleClass? = SampleClass()
        
        let function: (String) -> Int = ward(sample.unsafelyUnwrapped, else: -1) { _, string in
            return string.count
        }
        
        XCTAssert(function("Test") == 4)
        XCTAssert(function("TestTwo") == 7)
        
        sample = nil
        
        XCTAssert(function("Test") == -1)
    }
    
    func testJustGenericIn() {
        var counter: Int = 0
        
        var sample: SampleClass? = SampleClass()
        
        let function: (String) -> Void = ward(sample.unsafelyUnwrapped) { _, string in
            counter += string.count
        }
        
        XCTAssert(counter == 0)
        
        function("Test")
        
        XCTAssert(counter == 4)
        
        function("Tes")
        
        XCTAssert(counter == 7)
        
        sample = nil
        
        function("Test!")
        
        XCTAssert(counter == 7)
    }
    
    func testJustGenericOut() {
        var sample: SampleClass? = SampleClass()
        
        let function: () -> Bool = ward(sample.unsafelyUnwrapped, else: false) { _ in
            return true
        }
        
        XCTAssert(function() == true)
        
        sample = nil
        
        XCTAssert(function() == false)
    }
    
    func testVoidToVoid() {
        var counter = 0
        
        var sample: SampleClass? = SampleClass()
        
        let function: () -> Void = ward(sample.unsafelyUnwrapped) { _ in
            counter += 1
        }
        
        XCTAssert(counter == 0)
        
        function()
        
        XCTAssert(counter == 1)
        
        function()
        
        XCTAssert(counter == 2)
        
        sample = nil
        
        function()
        
        XCTAssert(counter == 2)
    }
}
