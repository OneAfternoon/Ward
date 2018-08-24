//
//  CurriedFunctionTests.swift
//  WardTests
//
//  Created by Swain Molster on 8/22/18.
//  Copyright © 2018 Swain Molster. All rights reserved.
//

import XCTest
@testable import Ward

class CurriedFunctionTests: XCTestCase {
    
    // MARK: Void Output
    
    func testCurryNoInputNoOutput() {
        var counter = 0
        var sample: SampleFunctionClass? = .init(noInputHandler: {
            counter += 1
        })
        
        let function: () -> Void = ward(sample.unsafelyUnwrapped, function: SampleFunctionClass.handleNoInput)
        
        function()
        
        XCTAssert(counter == 1)
        
        function()
        
        XCTAssert(counter == 2)
        
        sample = nil
        
        function()
        
        XCTAssert(counter == 2)
    }
    
    func testCurryOneInputNoOutput() {
        var counter = 0
        var sample: SampleFunctionClass? = .init(oneInputHandler: { a in
            counter += a
        })
        
        let function: (Int) -> Void = ward(sample.unsafelyUnwrapped, function: SampleFunctionClass.handleOneInput)
        
        function(1)
        
        XCTAssert(counter == 1)
        
        function(2)
        
        XCTAssert(counter == 3)
        
        sample = nil
        
        function(2)
        
        XCTAssert(counter == 3)
    }
    
    func testCurryTwoInputNoOutput() {
        var counter = 0
        var sample: SampleFunctionClass? = .init(twoInputHandler: { a, b in
            counter += a + b
        })
        
        let function: (Int, Int) -> Void = ward(sample.unsafelyUnwrapped, function: SampleFunctionClass.handleTwoInputs)
        
        function(1, 2)
        
        XCTAssert(counter == 3)
        
        function(0, -1)
        
        XCTAssert(counter == 2)
        
        sample = nil
        
        function(1, 1)
        
        XCTAssert(counter == 2)
    }
    
    func testCurryThreeInputNoOutput() {
        var counter = 0
        var sample: SampleFunctionClass? = .init(threeInputHandler: { a, b, c in
            counter += a + b + c
        })
        
        let function: (Int, Int, Int) -> Void = ward(sample.unsafelyUnwrapped, function: SampleFunctionClass.handleThreeInputs)
        
        function(1, 2, 3)
        
        XCTAssert(counter == 6)
        
        function(0, -1, -1)
        
        XCTAssert(counter == 4)
        
        sample = nil
        
        function(1, 1, 1)
        
        XCTAssert(counter == 4)
    }
    
    // MARK: Generic Output
    
    func testCurryNoInputWithOutput() {
        var counter = 0
        var sample: SampleFunctionClass<Bool>? = .init(noInputHandler: {
            return counter % 2 == 0
        })
        
        let function: () -> Bool = ward(sample.unsafelyUnwrapped, else: false, function: SampleFunctionClass.handleNoInput)
        
        XCTAssert(function() == true)
        
        counter = 1
        
        XCTAssert(function() == false)
        
        counter = 2
        
        XCTAssert(function() == true)
        
        sample = nil
        
        XCTAssert(function() == false)
    }
    
    func testCurryOneInputWithOutput() {
        var sample: SampleFunctionClass<Bool>? = .init(oneInputHandler: { a in
            return a % 2 == 0
        })
        
        let function: (Int) -> Bool = ward(sample.unsafelyUnwrapped, else: false, function: SampleFunctionClass.handleOneInput)
        
        XCTAssert(function(1) == false)
        
        XCTAssert(function(2) == true)
        
        sample = nil
        
        XCTAssert(function(2) == false)
        
    }
    
    func testCurryTwoInputWithOutput() {
        var sample: SampleFunctionClass<Bool>? = .init(twoInputHandler: { a, b in
            return (a + b) % 2 == 0
        })
        
        let function: (Int, Int) -> Bool = ward(sample.unsafelyUnwrapped, else: false, function: SampleFunctionClass.handleTwoInputs)
        
        XCTAssert(function(1, 0) == false)
        
        XCTAssert(function(1, 1) == true)
        
        sample = nil
        
        XCTAssert(function(1, 1) == false)
    }
    
    func testCurryThreeInputWithOutput() {
        var sample: SampleFunctionClass<Bool>? = .init(threeInputHandler: { a, b, c in
            return (a + b + c) % 2 == 0
        })
        
        let function: (Int, Int, Int) -> Bool = ward(sample.unsafelyUnwrapped, else: false, function: SampleFunctionClass.handleThreeInputs)
        
        XCTAssert(function(1, 0, 0) == false)
        
        XCTAssert(function(1, 1, 1) == false)
        
        XCTAssert(function(1, 2, 1) == true)
        
        sample = nil
        
        XCTAssert(function(1, 2, 1) == false)
    }
}
