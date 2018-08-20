//
//  Ward.swift
//  Ward
//
//  Created by Mack Hasz and Swain Molster on 8/16/18.
//  Copyright © 2018 Mack Hasz and Swain Molster. All rights reserved.
//

// MARK: Function literal variants

/* start functions that return Void */

/**
 Wards a `function` based on the lifetime of an `object`. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject>(_ object: Object, function: @escaping (Object) -> Void) -> () -> Void {
    return { [weak object] in
        guard let obj = object else { return }
        function(obj)
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
 Wards a `function` based on the lifetime of an `object`. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, A, B>(_ object: Object, function: @escaping (Object, A, B) -> Void) -> (A, B) -> Void {
    return { [weak object] a, b in
        guard let obj = object else { return }
        function(obj, a, b)
    }
}

/**
 Wards a `function` based on the lifetime of an `object`. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, A, B, C>(_ object: Object, function: @escaping (Object, A, B, C) -> Void) -> (A, B, C) -> Void {
    return { [weak object] a, b, c in
        guard let obj = object else { return }
        function(obj, a, b, c)
    }
}

/* start functions that return a value */

/**
 Wards a `function` based on the lifetime of an `object`, returing a `defaultValue` if `object` has deallocated. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, Z>(_ object: Object, else defaultValue: Z, function: @escaping (Object) -> Z) -> () -> Z {
    return { [weak object] in
        guard let obj = object else { return defaultValue }
        return function(obj)
    }
}

/**
 Wards a `function` based on the lifetime of an `object`, returing a `defaultValue` if `object` has deallocated. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, A, Z>(_ object: Object, else defaultValue: Z, function: @escaping (Object, A) -> Z) -> (A) -> Z {
    return { [weak object] a in
        guard let obj = object else { return defaultValue }
        return function(obj, a)
    }
}

/**
 Wards a `function` based on the lifetime of an `object`, returing a `defaultValue` if `object` has deallocated. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, A, B, Z>(_ object: Object, else defaultValue: Z, function: @escaping (Object, A, B) -> Z) -> (A, B) -> Z {
    return { [weak object] a, b in
        guard let obj = object else { return defaultValue }
        return function(obj, a, b)
    }
}

/**
 Wards a `function` based on the lifetime of an `object`, returing a `defaultValue` if `object` has deallocated. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, A, B, C, Z>(_ object: Object, else defaultValue: Z, function: @escaping (Object, A, B, C) -> Z) -> (A, B, C) -> Z {
    return { [weak object] a, b, c in
        guard let obj = object else { return defaultValue }
        return function(obj, a, b, c)
    }
}

// MARK: - KeyPath variants

/* start functions that return Void */

/**
 Wards a `function` located at a `keyPath` based on the lifetime of an `object`. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject>(_ object: Object, _ keyPath: KeyPath<Object, () -> Void>) -> () -> Void {
    return { [weak object] in
        guard let obj = object else { return }
        obj[keyPath: keyPath]()
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
 Wards a `function` located at a `keyPath` based on the lifetime of an `object`. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, A, B>(_ object: Object, _ keyPath: KeyPath<Object, (A, B) -> Void>) -> (A, B) -> Void {
    return { [weak object] a, b in
        guard let obj = object else { return }
        obj[keyPath: keyPath](a, b)
    }
}

/**
 Wards a `function` located at a `keyPath` based on the lifetime of an `object`. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, A, B, C>(_ object: Object, _ keyPath: KeyPath<Object, (A, B, C) -> Void>) -> (A, B, C) -> Void {
    return { [weak object] a, b, c in
        guard let obj = object else { return }
        obj[keyPath: keyPath](a, b, c)
    }
}

/* start functions that return a value */

/**
 Wards a `function` located at a `keyPath` based on the lifetime of an `object`, returing a `defaultValue` if `object` has deallocated. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, Z>(_ object: Object, else defaultValue: Z, _ keyPath: KeyPath<Object, () -> Z>) -> () -> Z {
    return { [weak object] in
        guard let obj = object else { return defaultValue }
        return obj[keyPath: keyPath]()
    }
}

/**
 Wards a `function` located at a `keyPath` based on the lifetime of an `object`, returing a `defaultValue` if `object` has deallocated. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, A, Z>(_ object: Object, else defaultValue: Z, _ keyPath: KeyPath<Object, (A) -> Z>) -> (A) -> Z {
    return { [weak object] a in
        guard let obj = object else { return defaultValue }
        return obj[keyPath: keyPath](a)
    }
}

/**
 Wards a `function` located at a `keyPath` based on the lifetime of an `object`, returing a `defaultValue` if `object` has deallocated. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, A, B, Z>(_ object: Object, else defaultValue: Z, _ keyPath: KeyPath<Object, (A, B) -> Z>) -> (A, B) -> Z {
    return { [weak object] a, b in
        guard let obj = object else { return defaultValue }
        return obj[keyPath: keyPath](a, b)
    }
}

/**
 Wards a `function` located at a `keyPath` based on the lifetime of an `object`, returing a `defaultValue` if `object` has deallocated. `object` will not be retained, and `function` will only be called if `object` is non-nil at call-time.
 */
public func ward<Object: AnyObject, A, B, C, Z>(_ object: Object, else defaultValue: Z, _ keyPath: KeyPath<Object, (A, B, C) -> Z>) -> (A, B, C) -> Z {
    return { [weak object] a, b, c in
        guard let obj = object else { return defaultValue }
        return obj[keyPath: keyPath](a, b, c)
    }
}
