//
//  FlatFunctionTests.swift
//  WardTests
//
//  Created by Mack Hasz and Swain Molster on 8/16/18.
//  Copyright © 2018 Mack Hasz and Swain Molster. All rights reserved.
//

import XCTest
@testable import Ward

class WardTests: XCTestCase {
    
    // MARK: - Void Output
    
    // MARK: + () -> Void
    
    func testOneWardVoidToVoid() {
        var counter = 0
        
        var sample: SampleClass? = SampleClass()
        
        let function: () -> Void = ward(sample.unsafelyUnwrapped) { _ in
            counter += 1
        }
        
        XCTAssert(counter == 0)
        
        function()
        
        XCTAssert(counter == 1)
        
        sample = nil
        
        function()
        
        XCTAssert(counter == 1)
    }
    
    
    func testTwoWardVoidToVoid() {
        var counter = 0
        
        var sampleOne: SampleClass? = SampleClass()
        var sampleTwo: SampleClass? = SampleClass()
        
        let function: () -> Void = ward(sampleOne.unsafelyUnwrapped, sampleTwo.unsafelyUnwrapped) { _, _ in
            counter += 1
        }
        
        XCTAssert(counter == 0)
        
        function()
        
        XCTAssert(counter == 1)
        
        sampleOne = nil
        
        function()
        
        XCTAssert(counter == 1)
        
        sampleTwo = nil
        
        function()
        
        XCTAssert(counter == 1)
    }
    
    
    func testThreeWardVoidToVoid() {
        var counter = 0
        
        var sampleOne: SampleClass? = SampleClass()
        var sampleTwo: SampleClass? = SampleClass()
        var sampleThree: SampleClass? = SampleClass()
        
        let function: () -> Void = ward(sampleOne.unsafelyUnwrapped, sampleTwo.unsafelyUnwrapped, sampleThree.unsafelyUnwrapped) { _, _, _ in
            counter += 1
        }
        
        XCTAssert(counter == 0)
        
        function()
        
        XCTAssert(counter == 1)
        
        sampleOne = nil
        
        function()
        
        XCTAssert(counter == 1)
        
        sampleTwo = nil
        
        function()
        
        XCTAssert(counter == 1)
        
        sampleThree = nil
        
        function()
        
        XCTAssert(counter == 1)
    }
    
    // MARK: + (A) -> Void
    
    func testOneWardAToVoid() {
        var counter = 0
        
        var sample: SampleClass? = SampleClass()
        
        let function: (Bool) -> Void = ward(sample.unsafelyUnwrapped) { _, a in
            let shouldInc = a
            counter += shouldInc ? 1 : 0
        }
        
        XCTAssert(counter == 0)
        
        function(true)
        
        XCTAssert(counter == 1)
        
        function(false)
        
        XCTAssert(counter == 1)
        
        sample = nil
        
        function(true)
        
        XCTAssert(counter == 1)
    }
    
    func testTwoWardAToVoid() {
        var counter = 0
        
        var sampleOne: SampleClass? = SampleClass()
        var sampleTwo: SampleClass? = SampleClass()
        
        let function: (Bool) -> Void = ward(sampleOne.unsafelyUnwrapped, sampleTwo.unsafelyUnwrapped) { _, _, a in
            let shouldInc = a
            counter += shouldInc ? 1 : 0
        }
        
        XCTAssert(counter == 0)
        
        function(true)
        
        XCTAssert(counter == 1)
        
        function(false)
        
        XCTAssert(counter == 1)
        
        sampleOne = nil
        
        function(true)
        
        XCTAssert(counter == 1)
        
        sampleTwo = nil
        
        function(true)
        
        XCTAssert(counter == 1)
    }
    
    func testThreeWardAToVoid() {
        var counter = 0
        
        var sampleOne: SampleClass? = SampleClass()
        var sampleTwo: SampleClass? = SampleClass()
        var sampleThree: SampleClass? = SampleClass()
        
        let function: (Bool) -> Void = ward(sampleOne.unsafelyUnwrapped, sampleTwo.unsafelyUnwrapped, sampleThree.unsafelyUnwrapped) { _, _, _, a in
            let shouldInc = a
            counter += shouldInc ? 1 : 0
        }
        
        XCTAssert(counter == 0)
        
        function(true)
        
        XCTAssert(counter == 1)
        
        function(false)
        
        XCTAssert(counter == 1)
        
        sampleOne = nil
        
        function(true)
        
        XCTAssert(counter == 1)
        
        sampleTwo = nil
        
        function(true)
        
        XCTAssert(counter == 1)
        
        sampleThree = nil
        
        function(true)
        
        XCTAssert(counter == 1)
    }
    
    // MARK: + (A, B) -> Void
    
    func testOneWardABToVoid() {
        var counter = 0
        
        var sample: SampleClass? = SampleClass()
        
        let function: (Bool, Bool) -> Void = ward(sample.unsafelyUnwrapped) { _, a, b in
            let shouldInc = a && b
            counter += shouldInc ? 1 : 0
        }
        
        XCTAssert(counter == 0)
        
        function(true, true)
        
        XCTAssert(counter == 1)
        
        function(false, true)
        
        XCTAssert(counter == 1)
        
        sample = nil
        
        function(true, true)
        
        XCTAssert(counter == 1)
    }
    
    func testTwoWardABToVoid() {
        var counter = 0
        
        var sampleOne: SampleClass? = SampleClass()
        var sampleTwo: SampleClass? = SampleClass()
        
        let function: (Bool, Bool) -> Void = ward(sampleOne.unsafelyUnwrapped, sampleTwo.unsafelyUnwrapped) { _, _, a, b in
            let shouldInc = a && b
            counter += shouldInc ? 1 : 0
        }
        
        XCTAssert(counter == 0)
        
        function(true, true)
        
        XCTAssert(counter == 1)
        
        function(false, true)
        
        XCTAssert(counter == 1)
        
        sampleOne = nil
        
        function(true, true)
        
        XCTAssert(counter == 1)
        
        sampleTwo = nil
        
        function(true, true)
        
        XCTAssert(counter == 1)
    }
    
    func testThreeWardABToVoid() {
        var counter = 0
        
        var sampleOne: SampleClass? = SampleClass()
        var sampleTwo: SampleClass? = SampleClass()
        var sampleThree: SampleClass? = SampleClass()
        
        let function: (Bool, Bool) -> Void = ward(sampleOne.unsafelyUnwrapped, sampleTwo.unsafelyUnwrapped, sampleThree.unsafelyUnwrapped) { _, _, _, a, b in
            let shouldInc = a && b
            counter += shouldInc ? 1 : 0
        }
        
        XCTAssert(counter == 0)
        
        function(true, true)
        
        XCTAssert(counter == 1)
        
        function(false, true)
        
        XCTAssert(counter == 1)
        
        sampleOne = nil
        
        function(true, true)
        
        XCTAssert(counter == 1)
        
        sampleTwo = nil
        
        function(true, true)
        
        XCTAssert(counter == 1)
        
        sampleThree = nil
        
        function(true, true)
        
        XCTAssert(counter == 1)
    }
    
    // MARK: + (A, B, C) -> Void
    
    func testOneWardABCToVoid() {
        var counter = 0
        
        var sample: SampleClass? = SampleClass()
        
        let function: (Bool, Bool, Bool) -> Void = ward(sample.unsafelyUnwrapped) { _, a, b, c in
            let shouldInc = a && b && c
            counter += shouldInc ? 1 : 0
        }
        
        XCTAssert(counter == 0)
        
        function(true, true, true)
        
        XCTAssert(counter == 1)
        
        function(false, true, true)
        
        XCTAssert(counter == 1)
        
        sample = nil
        
        function(true, true, true)
        
        XCTAssert(counter == 1)
    }
    
    func testTwoWardABCToVoid() {
        var counter = 0
        
        var sampleOne: SampleClass? = SampleClass()
        var sampleTwo: SampleClass? = SampleClass()
        
        let function: (Bool, Bool, Bool) -> Void = ward(sampleOne.unsafelyUnwrapped, sampleTwo.unsafelyUnwrapped) { _, _, a, b, c in
            let shouldInc = a && b && c
            counter += shouldInc ? 1 : 0
        }
        
        XCTAssert(counter == 0)
        
        function(true, true, true)
        
        XCTAssert(counter == 1)
        
        function(false, true, true)
        
        XCTAssert(counter == 1)
        
        sampleOne = nil
        
        function(true, true, true)
        
        XCTAssert(counter == 1)
        
        sampleTwo = nil
        
        function(true, true, true)
        
        XCTAssert(counter == 1)
    }
    
    func testThreeWardABCToVoid() {
        var counter = 0
        
        var sampleOne: SampleClass? = SampleClass()
        var sampleTwo: SampleClass? = SampleClass()
        var sampleThree: SampleClass? = SampleClass()
        
        let function: (Bool, Bool, Bool) -> Void = ward(sampleOne.unsafelyUnwrapped, sampleTwo.unsafelyUnwrapped, sampleThree.unsafelyUnwrapped) { _, _, _, a, b, c in
            let shouldInc = a && b && c
            counter += shouldInc ? 1 : 0
        }
        
        XCTAssert(counter == 0)
        
        function(true, true, true)
        
        XCTAssert(counter == 1)
        
        function(false, true, true)
        
        XCTAssert(counter == 1)
        
        sampleOne = nil
        
        function(true, true, true)
        
        XCTAssert(counter == 1)
        
        sampleTwo = nil
        
        function(true, true, true)
        
        XCTAssert(counter == 1)
        
        sampleThree = nil
        
        function(true, true, true)
        
        XCTAssert(counter == 1)
    }
    
    // MARK: - Generic Output
    
    // MARK: + () -> Z
    
    func testOneWardVoidToZ() {
        var sample: SampleClass? = SampleClass()
        
        let function: () -> Bool = ward(sample.unsafelyUnwrapped, else: false) { _ in
            return true
        }
        
        XCTAssert(function() == true)
        
        sample = nil
        
        XCTAssert(function() == false)
    }
    
    func testTwoWardVoidToZ() {
        var sampleOne: SampleClass? = SampleClass()
        var sampleTwo: SampleClass? = SampleClass()
        
        let function: () -> Bool = ward(sampleOne.unsafelyUnwrapped, sampleTwo.unsafelyUnwrapped, else: false) { _, _ in
            return true
        }
        
        XCTAssert(function() == true)
        
        sampleOne = nil
        
        XCTAssert(function() == false)
        
        sampleTwo = nil
        
        XCTAssert(function() == false)
    }
    
    func testThreeWardVoidToZ() {
        var sampleOne: SampleClass? = SampleClass()
        var sampleTwo: SampleClass? = SampleClass()
        var sampleThree: SampleClass? = SampleClass()
        
        let function: () -> Bool = ward(sampleOne.unsafelyUnwrapped, sampleTwo.unsafelyUnwrapped, sampleThree.unsafelyUnwrapped, else: false) { _, _, _ in
            return true
        }
        
        XCTAssert(function() == true)
        
        sampleOne = nil
        
        XCTAssert(function() == false)
        
        sampleTwo = nil
        
        XCTAssert(function() == false)
        
        sampleThree = nil
        
        XCTAssert(function() == false)
    }
    
    // MARK: + (A) -> Z
    
    func testOneWardAToZ() {
        var sample: SampleClass? = SampleClass()
        
        let function: (Int) -> Bool = ward(sample.unsafelyUnwrapped, else: false) { _, integer in
            return integer % 2 == 0
        }
        
        XCTAssert(function(2) == true)
        
        sample = nil
        
        XCTAssert(function(2) == false)
    }
    
    func testTwoWardAToZ() {
        var sampleOne: SampleClass? = SampleClass()
        var sampleTwo: SampleClass? = SampleClass()
        
        let function: (Int) -> Bool = ward(sampleOne.unsafelyUnwrapped, sampleTwo.unsafelyUnwrapped, else: false) { _, _, integer in
            return integer % 2 == 0
        }
        
        XCTAssert(function(2) == true)
        
        sampleOne = nil
        
        XCTAssert(function(2) == false)
        
        sampleTwo = nil
        
        XCTAssert(function(2) == false)
    }
    
    func testThreeWardAToZ() {
        var sampleOne: SampleClass? = SampleClass()
        var sampleTwo: SampleClass? = SampleClass()
        var sampleThree: SampleClass? = SampleClass()
        
        let function: (Int) -> Bool = ward(sampleOne.unsafelyUnwrapped, sampleTwo.unsafelyUnwrapped, sampleThree.unsafelyUnwrapped, else: false) { _, _, _, integer in
            return integer % 2 == 0
        }
        
        XCTAssert(function(2) == true)
        
        sampleOne = nil
        
        XCTAssert(function(2) == false)
        
        sampleTwo = nil
        
        XCTAssert(function(2) == false)
        
        sampleThree = nil
        
        XCTAssert(function(2) == false)
    }
    
    // MARK: + (A, B) -> Z
    
    func testOneWardABToZ() {
        var sample: SampleClass? = SampleClass()
        
        let function: (Int, Int) -> Bool = ward(sample.unsafelyUnwrapped, else: false) { _, integer1, integer2 in
            return (integer1 + integer2) % 2 == 0
        }
        
        XCTAssert(function(2, 1) == false)
        
        XCTAssert(function(2, 2) == true)
        
        sample = nil
        
        XCTAssert(function(2, 2) == false)
    }
    
    func testTwoWardABToZ() {
        var sampleOne: SampleClass? = SampleClass()
        var sampleTwo: SampleClass? = SampleClass()
        
        let function: (Int, Int) -> Bool = ward(sampleOne.unsafelyUnwrapped, sampleTwo.unsafelyUnwrapped, else: false) { _, _, integer1, integer2 in
            return (integer1 + integer2) % 2 == 0
        }
        
        XCTAssert(function(2, 2) == true)
        
        sampleOne = nil
        
        XCTAssert(function(2, 2) == false)
        
        sampleTwo = nil
        
        XCTAssert(function(2, 2) == false)
    }
    
    func testThreeWardABToZ() {
        var sampleOne: SampleClass? = SampleClass()
        var sampleTwo: SampleClass? = SampleClass()
        var sampleThree: SampleClass? = SampleClass()
        
        let function: (Int, Int) -> Bool = ward(sampleOne.unsafelyUnwrapped, sampleTwo.unsafelyUnwrapped, sampleThree.unsafelyUnwrapped, else: false) { _, _, _, integer1, integer2 in
            return (integer1 + integer2) % 2 == 0
        }
        
        XCTAssert(function(2, 2) == true)
        
        sampleOne = nil
        
        XCTAssert(function(2, 2) == false)
        
        sampleTwo = nil
        
        XCTAssert(function(2, 2) == false)
        
        sampleThree = nil
        
        XCTAssert(function(2, 2) == false)
    }
    
    // MARK: + (A, B, C) -> Z
    
    func testOneWardABCToZ() {
        var sample: SampleClass? = SampleClass()
        
        let function: (Int, Int, Int) -> Bool = ward(sample.unsafelyUnwrapped, else: false) { _, integer1, integer2, integer3 in
            return (integer1 + integer2 + integer3) % 2 == 0
        }
        
        XCTAssert(function(2, 2, 1) == false)
        
        XCTAssert(function(2, 2, 2) == true)
        
        sample = nil
        
        XCTAssert(function(2, 2, 2) == false)
    }
    
    func testTwoWardABCToZ() {
        var sampleOne: SampleClass? = SampleClass()
        var sampleTwo: SampleClass? = SampleClass()
        
        let function: (Int, Int, Int) -> Bool = ward(sampleOne.unsafelyUnwrapped, sampleTwo.unsafelyUnwrapped, else: false) { _, _, integer1, integer2, integer3 in
            return (integer1 + integer2 + integer3) % 2 == 0
        }
        
        XCTAssert(function(2, 2, 1) == false)
        
        XCTAssert(function(2, 2, 2) == true)
        
        sampleOne = nil
        
        XCTAssert(function(2, 2, 2) == false)
        
        sampleTwo = nil
        
        XCTAssert(function(2, 2, 2) == false)
    }
    
    func testThreeWardABCToZ() {
        var sampleOne: SampleClass? = SampleClass()
        var sampleTwo: SampleClass? = SampleClass()
        var sampleThree: SampleClass? = SampleClass()
        
        let function: (Int, Int, Int) -> Bool = ward(sampleOne.unsafelyUnwrapped, sampleTwo.unsafelyUnwrapped, sampleThree.unsafelyUnwrapped, else: false) { _, _, _, integer1, integer2, integer3 in
            return (integer1 + integer2 + integer3) % 2 == 0
        }
        
        XCTAssert(function(2, 2, 1) == false)
        
        XCTAssert(function(2, 2, 2) == true)
        
        sampleOne = nil
        
        XCTAssert(function(2, 2, 2) == false)
        
        sampleTwo = nil
        
        XCTAssert(function(2, 2, 2) == false)
        
        sampleThree = nil
        
        XCTAssert(function(2, 2, 2) == false)
    }
}
