//
//  Ward.swift
//  Ward
//
//  Created by Swain Molster on 8/16/18.
//  Copyright © 2018 Swain Molster. All rights reserved.
//

// MARK: Simple functions

public func ward<Object: AnyObject, A, B>(_ obj: Object, withDefault defaultValue: B, function: @escaping (Object, A) -> B) -> (A) -> B {
    return { [weak obj] a in
        guard let obj = obj else { return defaultValue }
        return function(obj, a)
    }
}

public func ward<Object: AnyObject, A>(_ obj: Object, function: @escaping (Object, A) -> Void) -> (A) -> Void {
    return { [weak obj] a in
        guard let obj = obj else { return }
        function(obj, a)
    }
}

public func ward<Object: AnyObject, B>(_ obj: Object, withDefault defaultValue: B, function: @escaping (Object) -> B) -> () -> B {
    return { [weak obj] in
        guard let obj = obj else { return defaultValue }
        return function(obj)
    }
}

public func ward<Object: AnyObject>(_ obj: Object, function: @escaping (Object) -> Void) -> () -> Void {
    return { [weak obj] in
        guard let obj = obj else { return }
        function(obj)
    }
}

// MARK: - KeyPaths

public func ward<Object: AnyObject, A, B>(_ obj: Object, withDefault defaultValue: B, _ keyPath: KeyPath<Object, (A) -> B>) -> (A) -> B {
    return { [weak obj] a in
        guard let obj = obj else { return defaultValue }
        return obj[keyPath: keyPath](a)
    }
}

public func ward<Object: AnyObject, A>(_ obj: Object, _ keyPath: KeyPath<Object, (A) -> Void>) -> (A) -> Void {
    return { [weak obj] a in
        guard let obj = obj else { return }
        obj[keyPath: keyPath](a)
    }
}

public func ward<Object: AnyObject, B>(_ obj: Object, withDefault defaultValue: B, _ keyPath: KeyPath<Object, () -> B>) -> () -> B {
    return { [weak obj] in
        guard let obj = obj else { return defaultValue }
        return obj[keyPath: keyPath]()
    }
}

public func ward<Object: AnyObject>(_ obj: Object, _ keyPath: KeyPath<Object, () -> Void>) -> () -> Void {
    return { [weak obj] in
        guard let obj = obj else { return }
        obj[keyPath: keyPath]()
    }
}
