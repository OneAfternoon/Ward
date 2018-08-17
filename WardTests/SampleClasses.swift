//
//  SampleClasses.swift
//  WardTests
//
//  Created by Swain Molster on 8/16/18.
//  Copyright © 2018 Swain Molster. All rights reserved.
//

import Foundation
import UIKit

@testable import Ward

protocol ViewModelOutputs: class {
    var showAlertString: ((String) -> Void)? { get set }
    
    var displayListOfStrings: (([String]) -> Void)? { get set }
}

protocol ViewModelType {
    var outputs: ViewModelOutputs { get }
}

class ViewModel: ViewModelOutputs, ViewModelType {
    
    init() { }
    
    var showAlertString: ((String) -> Void)?
    
    var displayListOfStrings: (([String]) -> Void)?
    
    var outputs: ViewModelOutputs { return self }
}

class SampleViewController: UIViewController {
    
    let viewModel: ViewModelType = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.outputs.displayListOfStrings = ward(self) { strongSelf, strings in
            // strongSelf is of type SampleViewController
        }
        
        // \.showAlert is of type KeyPath<SampleViewController, (String) -> Void>
        viewModel.outputs.showAlertString = ward(self, \.showAlert)
    }
}

extension UIViewController {
    
    // Code does not compile when this is declared as a function :(
    
    var showAlert: (String) -> Void {
        return { string in
            self.title = string
        }
    }
}
