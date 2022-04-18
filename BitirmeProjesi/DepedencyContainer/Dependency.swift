//
//  Dependency.swift
//  DepedencyContainer
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 17.04.2022.
//

import Foundation

public protocol IsDependency:AnyObject{
    
}

@propertyWrapper
public final class Dependency<T:IsDependency>{
    public var wrappedValue:T
    
    public init(wrappedValue:T){
        self.wrappedValue = DIContainer.resolve()
    }
}




