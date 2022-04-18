//
//  DependencyContainer.swift
//  DepedencyContainer
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 17.04.2022.
//

import Foundation

public final class DIContainer {
    
    private var dependencies:[String:Injectable] = [:]
    
    
    public static let shared = DIContainer()
    private init() {}
    
    
    
    public func add<T: Injectable>(_ injectable: T) {
        let key = String(reflecting: injectable)
        dependencies[key] = injectable
    }

    public func resolve<T: Injectable>() -> T {
        let key = String(reflecting: T.self)
        
        guard let injectable = dependencies[key] as? T else {
            fatalError("\(key) has not been added as an injectable object.")
        }
        
        return injectable
    }
}



//public final class DIContainer {
//
//    private var dependencies:[String:Weak] = [:]
//
//
//    private static var shared = DIContainer.init()
//
//    public static func register<T:IsDependency>(_ dependency:T){
//        shared.register(dependency)
//    }
//    public static func resolve<T:IsDependency>() -> T {
//        shared.resolve()
//    }
//
//    private func register<T:IsDependency>(_ dependency:T){
//        let key = "\(type(of: T.self))"
//
//        let weak = Weak(value: dependency as AnyObject)
//        dependencies[key] = weak
//
//    }
//
//    private func resolve<T:IsDependency>() -> T {
//        let key = "\(type(of: T.self))"
//        let weak = dependencies[key]
//
//        precondition(weak != nil, "No dependency found for \(key), Application register a dependency before resolving it")
//
//        let dependency = weak!.value as? T
//
//        precondition(dependency != nil, "No dependency found for \(key), Dependency is already deallocated by the system")
//
//        return dependency!
//    }
//}
