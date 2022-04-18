//
//  GenericRepositoryProtocol.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 15.04.2022.
//

import Foundation
import Combine
import Infrastructure

//protocol Repository {
//    associatedtype T
//    
//    var service:DataTransferService {get}
//    
//    
//    
//    func get(id: Int, completionHandler: (T?, Error?) -> Void)
//    func list(completionHandler: ([T]?, Error?) -> Void)
//    func add(_ item: T, completionHandler: (Error?) -> Void)
//    func delete(_ item: T, completionHandler: (Error?) -> Void)
//    func edit(_ item: T, completionHandler: (Error?) -> Void)
//}
//
//extension Repository{
//    
//    func list(completionHandler: ([T]?, Error?) -> Void){
//        
//    }
//    func add(_ item: T, completionHandler: (Error?) -> Void){
//        
//    }
//    func delete(_ item: T, completionHandler: (Error?) -> Void){
//        
//    }
//    func edit(_ item: T, completionHandler: (Error?) -> Void){
//        
//    }
//}


protocol CombineRepository {
    associatedtype T
    
    func get(id: Int) -> AnyPublisher<T, Error>
    func list() -> AnyPublisher<[T], Error>
    func add(_ item: T) -> AnyPublisher<Void, Error>
    func delete(_ item: T) -> AnyPublisher<Void, Error>
    func edit(_ item: T) -> AnyPublisher<Void, Error>
}
