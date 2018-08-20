# Ward

[![Travis CI](https://img.shields.io/travis/OneAfternoon/Ward/master.svg?style=flat-square)](https://travis-ci.org/OneAfternoon/Ward) [![code cov](https://img.shields.io/codecov/c/github/OneAfternoon/Ward.svg?style=flat-square)](https://codecov.io/gh/OneAfternoon/Ward) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat-square)](https://github.com/Carthage/Carthage) ![Swift 4.1](https://img.shields.io/badge/Swift-4.1-orange.svg?style=flat-square) [![license](	https://img.shields.io/github/license/OneAfternoon/Ward.svg?style=flat-square)](https://github.com/OneAfternoon/Ward/blob/master/LICENSE)

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
For callbacks that return, provide a default value if the object can't be unwrapped. 
```swift
present(vc, shouldExit: ward(self, else: true) { strongSelf
    return strongSelf.shouldExit
})
```

Or, you can change your function declaration to a computed `var`, and use the `KeyPath` based API:

```swift
class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        useAClosureBasedAPI(block: ward(self, \.handleSomething))
    }
    
    var handleSomething: (_ something: Any) -> Void { 
        return { any in 
            ...
        }
    }
}
```

Plays well with generic inputs & outputs, too!

```swift
let function: (String) -> Int = ward(self) { strongSelf, string in
    return strongSelf.stringToInt(string)
}
```

## Try it out on Carthage!
```
github 'OneAfternoon/Ward'
```

## Authors
- Mack Hasz ([@lazyvar](https://github.com/lazyvar))
- Swain Molster ([@smolster](https://github.com/smolster))
