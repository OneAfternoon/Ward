//
//  Ward.swift
//  Ward
//
//  Created by Mack Hasz and Swain Molster on 8/16/18.
//  Copyright © 2018 Mack Hasz and Swain Molster. All rights reserved.
//

// MARK: - Flat Function Variants

// MARK: Void Output

// MARK: + () -> Void

public func ward<First: AnyObject>(_ first: First, function: @escaping (First) -> Void) -> () -> Void {
    return { [weak first] in
        guard let first = first else { return }
        function(first)
    }
}

public func ward<First: AnyObject, Second: AnyObject>(_ first: First, _ second: Second, function: @escaping (First, Second) -> Void) -> () -> Void {
    return { [weak first, weak second] in
        guard let first = first, let second = second else { return }
        function(first, second)
    }
}

public func ward<First: AnyObject, Second: AnyObject, Third: AnyObject>(_ first: First, _ second: Second, _ third: Third, function: @escaping (First, Second, Third) -> Void) -> () -> Void {
    return { [weak first, weak second, weak third] in
        guard let first = first, let second = second, let third = third else { return }
        function(first, second, third)
    }
}

// MARK: + (A) -> Void

public func ward<First: AnyObject, A>(_ first: First, function: @escaping (First, A) -> Void) -> (A) -> Void {
    return { [weak first] a in
        guard let first = first else { return }
        function(first, a)
    }
}

public func ward<First: AnyObject, Second: AnyObject, A>(_ first: First, _ second: Second, function: @escaping (First, Second, A) -> Void) -> (A) -> Void {
    return { [weak first, weak second] a in
        guard let first = first, let second = second else { return }
        function(first, second, a)
    }
}

public func ward<First: AnyObject, Second: AnyObject, Third: AnyObject, A>(_ first: First, _ second: Second, _ third: Third, function: @escaping (First, Second, Third, A) -> Void) -> (A) -> Void {
    return { [weak first, weak second, weak third] a in
        guard let first = first, let second = second, let third = third else { return }
        function(first, second, third, a)
    }
}

// MARK: + (A, B) -> Void

public func ward<First: AnyObject, A, B>(_ first: First, function: @escaping (First, A, B) -> Void) -> (A, B) -> Void {
    return { [weak first] a, b in
        guard let first = first else { return }
        function(first, a, b)
    }
}

public func ward<First: AnyObject, Second: AnyObject, A, B>(_ first: First, _ second: Second, function: @escaping (First, Second, A, B) -> Void) -> (A, B) -> Void {
    return { [weak first, weak second] a, b in
        guard let first = first, let second = second else { return }
        function(first, second, a, b)
    }
}

public func ward<First: AnyObject, Second: AnyObject, Third: AnyObject, A, B>(_ first: First, _ second: Second, _ third: Third, function: @escaping (First, Second, Third, A, B) -> Void) -> (A, B) -> Void {
    return { [weak first, weak second, weak third] a, b in
        guard let first = first, let second = second, let third = third else { return }
        function(first, second, third, a, b)
    }
}

// MARK: + (A, B, C) -> Void

public func ward<First: AnyObject, A, B, C>(_ first: First, function: @escaping (First, A, B, C) -> Void) -> (A, B, C) -> Void {
    return { [weak first] a, b, c in
        guard let first = first else { return }
        function(first, a, b, c)
    }
}

public func ward<First: AnyObject, Second: AnyObject, A, B, C>(_ first: First, _ second: Second, function: @escaping (First, Second, A, B, C) -> Void) -> (A, B, C) -> Void {
    return { [weak first, weak second] a, b, c in
        guard let first = first, let second = second else { return }
        function(first, second, a, b, c)
    }
}

public func ward<First: AnyObject, Second: AnyObject, Third: AnyObject, A, B, C>(_ first: First, _ second: Second, _ third: Third, function: @escaping (First, Second, Third, A, B, C) -> Void) -> (A, B, C) -> Void {
    return { [weak first, weak second, weak third] a, b, c in
        guard let first = first, let second = second, let third = third else { return }
        function(first, second, third, a, b, c)
    }
}

// MARK: Generic Output

// MARK: + () -> Z

public func ward<First: AnyObject, Z>(_ first: First, else defaultValue: Z, function: @escaping (First) -> Z) -> () -> Z {
    return { [weak first] in
        guard let first = first else { return defaultValue }
        return function(first)
    }
}

public func ward<First: AnyObject, Second: AnyObject, Z>(_ first: First, _ second: Second, else defaultValue: Z, function: @escaping (First, Second) -> Z) -> () -> Z {
    return { [weak first, weak second] in
        guard let first = first, let second = second else { return defaultValue }
        return function(first, second)
    }
}

public func ward<First: AnyObject, Second: AnyObject, Third: AnyObject, Z>(_ first: First, _ second: Second, _ third: Third, else defaultValue: Z, function: @escaping (First, Second, Third) -> Z) -> () -> Z {
    return { [weak first, weak second, weak third] in
        guard let first = first, let second = second, let third = third else { return defaultValue }
        return function(first, second, third)
    }
}

// MARK: + (A) -> Z

public func ward<First: AnyObject, A, Z>(_ first: First, else defaultValue: Z, function: @escaping (First, A) -> Z) -> (A) -> Z {
    return { [weak first] a in
        guard let first = first else { return defaultValue }
        return function(first, a)
    }
}

public func ward<First: AnyObject, Second: AnyObject, A, Z>(_ first: First, _ second: Second, else defaultValue: Z, function: @escaping (First, Second, A) -> Z) -> (A) -> Z {
    return { [weak first, weak second] a in
        guard let first = first, let second = second else { return defaultValue }
        return function(first, second, a)
    }
}

public func ward<First: AnyObject, Second: AnyObject, Third: AnyObject, A, Z>(_ first: First, _ second: Second, _ third: Third, else defaultValue: Z, function: @escaping (First, Second, Third, A) -> Z) -> (A) -> Z {
    return { [weak first, weak second, weak third] a in
        guard let first = first, let second = second, let third = third else { return defaultValue }
        return function(first, second, third, a)
    }
}

// MARK: + (A, B) -> Z

public func ward<First: AnyObject, A, B, Z>(_ first: First, else defaultValue: Z, function: @escaping (First, A, B) -> Z) -> (A, B) -> Z {
    return { [weak first] a, b in
        guard let first = first else { return defaultValue }
        return function(first, a, b)
    }
}

public func ward<First: AnyObject, Second: AnyObject, A, B, Z>(_ first: First, _ second: Second, else defaultValue: Z, function: @escaping (First, Second, A, B) -> Z) -> (A, B) -> Z {
    return { [weak first, weak second] a, b in
        guard let first = first, let second = second else { return defaultValue }
        return function(first, second, a, b)
    }
}

public func ward<First: AnyObject, Second: AnyObject, Third: AnyObject, A, B, Z>(_ first: First, _ second: Second, _ third: Third, else defaultValue: Z, function: @escaping (First, Second, Third, A, B) -> Z) -> (A, B) -> Z {
    return { [weak first, weak second, weak third] a, b in
        guard let first = first, let second = second, let third = third else { return defaultValue }
        return function(first, second, third, a, b)
    }
}

// MARK: + (A, B, C) -> Z

public func ward<Object: AnyObject, A, B, C, Z>(_ object: Object, else defaultValue: Z, function: @escaping (Object, A, B, C) -> Z) -> (A, B, C) -> Z {
    return { [weak object] a, b, c in
        guard let obj = object else { return defaultValue }
        return function(obj, a, b, c)
    }
}

// MARK: - Curried Function Variants

// MARK: Void Output

// MARK: + () -> Void
public func ward<Object: AnyObject>(_ object: Object, function: @escaping (Object) -> () -> Void) -> () -> Void {
    return { [weak object] in
        guard let object = object else { return }
        function(object)()
    }
}

// MARK: + (A) -> Void
public func ward<Object: AnyObject, A>(_ object: Object, function: @escaping (Object) -> (A) -> Void) -> (A) -> Void {
    return { [weak object] a in
        guard let object = object else { return }
        function(object)(a)
    }
}

// MARK: + (A, B) -> Void
public func ward<Object: AnyObject, A, B>(_ object: Object, function: @escaping (Object) -> (A, B) -> Void) -> (A, B) -> Void {
    return { [weak object] a, b in
        guard let object = object else { return }
        function(object)(a, b)
    }
}

// MARK: + (A, B, C) -> Void
public func ward<Object: AnyObject, A, B, C>(_ object: Object, function: @escaping (Object) -> (A, B, C) -> Void) -> (A, B, C) -> Void {
    return { [weak object] a, b, c in
        guard let object = object else { return }
        function(object)(a, b, c)
    }
}

// MARK: Generic Output

// MARK: + () -> Z
public func ward<Object: AnyObject, Z>(_ object: Object, else defaultValue: Z, function: @escaping (Object) -> () -> Z) -> () -> Z {
    return { [weak object] in
        guard let object = object else { return defaultValue }
        return function(object)()
    }
}

// MARK: + (A) -> Z
public func ward<Object: AnyObject, A, Z>(_ object: Object, else defaultValue: Z, function: @escaping (Object) -> (A) -> Z) -> (A) -> Z {
    return { [weak object] a in
        guard let object = object else { return defaultValue }
        return function(object)(a)
    }
}

// MARK: + (A, B) -> Z
public func ward<Object: AnyObject, A, B, Z>(_ object: Object, else defaultValue: Z, function: @escaping (Object) -> (A, B) -> Z) -> (A, B) -> Z {
    return { [weak object] a, b in
        guard let object = object else { return defaultValue }
        return function(object)(a, b)
    }
}

// MARK: + (A, B, C) -> Void
public func ward<Object: AnyObject, A, B, C, Z>(_ object: Object, else defaultValue: Z, function: @escaping (Object) -> (A, B, C) -> Z) -> (A, B, C) -> Z {
    return { [weak object] a, b, c in
        guard let object = object else { return defaultValue }
        return function(object)(a, b, c)
    }
}
