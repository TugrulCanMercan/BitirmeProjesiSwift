//
//  Dependency.swift
//  DepedencyContainer
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 17.04.2022.
//

import Foundation

public protocol Injectable {}



@propertyWrapper
public struct Inject<T: Injectable> {
    public let wrappedValue: T
    
    
    public init(){
        wrappedValue = DIContainer.shared.resolve()
    }
}




