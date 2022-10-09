//
//  Observable.swift
//
//
//  Created by Will Chen on 2022/10/9.
//
import Foundation

// Observable
public class Observable<T> {
    public var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var listener: ((T?)-> Void)?
    
    public func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listener = listener
    }
}
