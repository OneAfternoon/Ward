//
//  SampleClasses.swift
//  WardTests
//
//  Created by Mack Hasz and Swain Molster on 8/16/18.
//  Copyright © 2018 Mack Hasz and Swain Molster. All rights reserved.
//

class SampleClass { }

class SampleFunctionClass<Output> {
    
    private let noInputHandler: (() -> Output)?
    private let oneInputHandler: ((Int) -> Output)?
    private let twoInputHandler: ((Int, Int) -> Output)?
    private let threeInputHandler: ((Int, Int, Int) -> Output)?
    
    init(
        noInputHandler: (() -> Output)? = nil,
        oneInputHandler: ((Int) -> Output)? = nil,
        twoInputHandler: ((Int, Int) -> Output)? = nil,
        threeInputHandler: ((Int, Int, Int) -> Output)? = nil
    ) {
        self.noInputHandler = noInputHandler
        self.oneInputHandler = oneInputHandler
        self.twoInputHandler = twoInputHandler
        self.threeInputHandler = threeInputHandler
    }
    
    func handleNoInput() -> Output {
        return noInputHandler!()
    }
    
    func handleOneInput(_ a: Int) -> Output {
        return oneInputHandler!(a)
    }
    
    func handleTwoInputs(_ a: Int, _ b: Int) -> Output {
        return twoInputHandler!(a, b)
    }
    
    func handleThreeInputs(_ a: Int, _ b: Int, _ c: Int) -> Output {
        return threeInputHandler!(a, b, c)
    }
}
