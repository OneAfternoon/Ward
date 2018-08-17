//
//  Ward.swift
//  Ward
//
//  Created by Mack Hasz and Swain Molster on 8/16/18.
//  Copyright © 2018 Mack Hasz and Swain Molster. All rights reserved.
//

// MARK: Function literal variants

/**
 Wards a `function` based on the lifetime of an `object`, returing a `defaultValue` if `object` has deallocated. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, A, B>(_ object: Object, withDefault defaultValue: B, function: @escaping (Object, A) -> B) -> (A) -> B {
    return { [weak object] a in
        guard let obj = object else { return defaultValue }
        return function(obj, a)
    }
}

/**
 Wards a `function` based on the lifetime of an `object`. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, A>(_ object: Object, function: @escaping (Object, A) -> Void) -> (A) -> Void {
    return { [weak object] a in
        guard let obj = object else { return }
        function(obj, a)
    }
}

/**
 Wards a `function` based on the lifetime of an `object`, returing a `defaultValue` if `object` has deallocated. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, B>(_ object: Object, withDefault defaultValue: B, function: @escaping (Object) -> B) -> () -> B {
    return { [weak object] in
        guard let obj = object else { return defaultValue }
        return function(obj)
    }
}

/**
 Wards a `function` based on the lifetime of an `object`. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject>(_ object: Object, function: @escaping (Object) -> Void) -> () -> Void {
    return { [weak object] in
        guard let obj = object else { return }
        function(obj)
    }
}

// MARK: - KeyPath variants

/**
 Wards a `function` located at a `keyPath` based on the lifetime of an `object`, returing a `defaultValue` if `object` has deallocated. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, A, B>(_ object: Object, withDefault defaultValue: B, _ keyPath: KeyPath<Object, (A) -> B>) -> (A) -> B {
    return { [weak object] a in
        guard let obj = object else { return defaultValue }
        return obj[keyPath: keyPath](a)
    }
}

/**
 Wards a `function` located at a `keyPath` based on the lifetime of an `object`. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, A>(_ object: Object, _ keyPath: KeyPath<Object, (A) -> Void>) -> (A) -> Void {
    return { [weak object] a in
        guard let obj = object else { return }
        obj[keyPath: keyPath](a)
    }
}

/**
 Wards a `function` located at a `keyPath` based on the lifetime of an `object`, returing a `defaultValue` if `object` has deallocated. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, B>(_ object: Object, withDefault defaultValue: B, _ keyPath: KeyPath<Object, () -> B>) -> () -> B {
    return { [weak object] in
        guard let obj = object else { return defaultValue }
        return obj[keyPath: keyPath]()
    }
}

/**
 Wards a `function` located at a `keyPath` based on the lifetime of an `object`. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject>(_ object: Object, _ keyPath: KeyPath<Object, () -> Void>) -> () -> Void {
    return { [weak object] in
        guard let obj = object else { return }
        obj[keyPath: keyPath]()
    }
}
