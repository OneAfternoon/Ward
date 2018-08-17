//
//  WardTests.swift
//  WardTests
//
//  Created by Swain Molster on 8/16/18.
//  Copyright © 2018 Swain Molster. All rights reserved.
//

import XCTest
@testable import Ward

private class SampleClass { }

private class SampleKeyPathClass {
    
    private var voidToVoidAction: (() -> Void)?
    private var stringToVoidAction: ((String) -> Void)?
    private var voidToBoolAction: (() -> Bool)?
    private var stringToIntAction: ((String) -> Int)?
    
    init(voidToVoid: @escaping () -> Void) {
        self.voidToVoidAction = voidToVoid
    }
    
    init(stringToVoid: @escaping (String) -> Void) {
        self.stringToVoidAction = stringToVoid
    }
    
    init(voidToBool: @escaping () -> Bool) {
        self.voidToBoolAction = voidToBool
    }
    
    init(stringToInt: @escaping (String) -> Int) {
        self.stringToIntAction = stringToInt
    }
    
    var voidToVoid: () -> Void {
        return voidToVoidAction!
    }
    
    var stringToVoid: (String) -> Void {
        return stringToVoidAction!
    }
    
    var voidToBool: () -> Bool {
        return voidToBoolAction!
    }
    
    var stringToInt: (String) -> Int {
        return stringToIntAction!
    }
}

class WardTests: XCTestCase {
    
    func testGenericInAndOut() {
        var sample: SampleClass? = SampleClass()
        
        let function: (String) -> Int = ward(sample.unsafelyUnwrapped, withDefault: -1) { _, string in
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
        
        let function: () -> Bool = ward(sample.unsafelyUnwrapped, withDefault: false) { _ in
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
    
    func testKeyPathGenericInAndOut() {
        var sample: SampleKeyPathClass? = SampleKeyPathClass(stringToInt: { string in
            return string.count
        })
        
        let function: (String) -> Int = ward(sample.unsafelyUnwrapped, withDefault: -1, \.stringToInt)
        
        XCTAssert(function("Test") == 4)
        XCTAssert(function("TestTwo") == 7)
        
        sample = nil
        
        XCTAssert(function("Test") == -1)
    }
    
    func testKeyPathJustGenericIn() {
        var counter: Int = 0
        
        var sample: SampleKeyPathClass? = SampleKeyPathClass(stringToVoid: { string in
            counter += string.count
        })
        
        let function: (String) -> Void = ward(sample.unsafelyUnwrapped, \.stringToVoid)
        
        XCTAssert(counter == 0)
        
        function("Test")
        
        XCTAssert(counter == 4)
        
        function("Tes")
        
        XCTAssert(counter == 7)
        
        sample = nil
        
        function("Test!")
        
        XCTAssert(counter == 7)
    }
    
    func testKeyPathJustGenericOut() {
        var sample: SampleKeyPathClass? = SampleKeyPathClass(voidToBool: {
            return true
        })
        
        let function: () -> Bool = ward(sample.unsafelyUnwrapped, withDefault: false, \.voidToBool)
        
        XCTAssert(function() == true)
        
        sample = nil
        
        XCTAssert(function() == false)
    }
    
    func testKeyPathVoidToVoid() {
        
        var counter = 0
        
        var sample: SampleKeyPathClass? = SampleKeyPathClass(voidToVoid: {
            counter += 1
        })
        
        let function: () -> Void = ward(sample.unsafelyUnwrapped, \.voidToVoid)
        
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
