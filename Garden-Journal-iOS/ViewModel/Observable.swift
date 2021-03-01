//
//  Observable.swift
//  Garden-Journal-iOS
//
//  Created by Victor Ruiz on 2/21/21.
//

import Foundation

class Observable<ObservedType> {

    init(_ value: ObservedType) {
        self.value = value
    }
    
//    var valueChanged: ((ObservedType?) -> ())?
    
    var value: ObservedType {
        didSet {
            listener?(value)
        }
    }
    
//    func bindingChanged(to newValue: ObservedType) {
//        _value = newValue
//        print("Value is now \(newValue)")
//    }
//
    typealias Listener = (ObservedType) -> ()
    var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
