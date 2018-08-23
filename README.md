# Ward

[![Travis CI](https://img.shields.io/travis/OneAfternoon/Ward/master.svg?style=flat-square)](https://travis-ci.org/OneAfternoon/Ward) [![code cov](https://img.shields.io/codecov/c/github/OneAfternoon/Ward.svg?style=flat-square)](https://codecov.io/gh/OneAfternoon/Ward) [![pod](https://img.shields.io/cocoapods/v/Ward.svg?style=flat-square)](https://cocoapods.org/pods/Ward) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat-square)](https://github.com/Carthage/Carthage) ![Swift 4.1](https://img.shields.io/badge/Swift-4.1-orange.svg?style=flat-square) [![license](	https://img.shields.io/github/license/OneAfternoon/Ward.svg?style=flat-square)](https://github.com/OneAfternoon/Ward/blob/master/LICENSE)

`ward` is a Swift micro-framework to help with cleaning up ugly memory-management syntax.

### Before
```swift
func useAClosureBasedAPI(block: @escaping (Something) -> Void) { ... }

useAClosureBasedAPI(block: { [weak self] something in
    guard let strongSelf = self else {
        return
    }
    
    strongSelf.handle(something)
})
```

### After

```swift
useAClosureBasedAPI(block: ward(self) { strongSelf, something in
    strongSelf.handle(something)
})
```

### Supports Swift's unapplied method references 

Use the curried function API to call Swift's automatically synthesized static accessors for instance methods:

```swift
class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        useAClosureBasedAPI(block: ward(self, MyViewController.handleSomething))
        // MyViewController.handleSomething is of type (MyViewController) -> (Something) -> Void
    }
    
    func handleSomething(_ something: Something) {
        ...
    }
}
```

### Supports non-`Void` returning closures

```swift
/// Returns true when `self` has not deallocated and `count` is even.
let selfIsAliveAndCountIsEven: (_ count: Int) -> Bool = ward(self, else: false) { strongSelf, count in
    return count % 2 == 0
}
```

## Try it out!
**Carthage**
```
github 'OneAfternoon/Ward' ~> 1.0
```

**CocoaPods**
```
pod 'Ward', '~> 1.0'
```

## Authors
- Mack Hasz ([@lazyvar](https://github.com/lazyvar))
- Swain Molster ([@smolster](https://github.com/smolster))
