//
//  SampleClasses.swift
//  WardTests
//
//  Created by Mack Hasz and Swain Molster on 8/16/18.
//  Copyright © 2018 Mack Hasz and Swain Molster. All rights reserved.
//

class SampleClass { }

class SampleKeyPathClass {
    
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
