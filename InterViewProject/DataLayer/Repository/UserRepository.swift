//
//  UserRepository.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.04.2022.
//

import Foundation
import Combine
import Infrastructure

final class UserRepository{
    
    let networkService:DataTransferService
    var cancellable = Set<AnyCancellable>()
    init(networkService:DataTransferService){
        self.networkService = networkService
        
    }
   
    
}

extension UserRepository:UserRepositoryProtocol{
    func getUserInfo(completionHandler: @escaping (Result<UserInfo, Error>) -> Void) {
        let endpoint = APIEndpoints.getUser()
        networkService.request(with: endpoint) { result in
            switch result{
                
            case .success(let data):
                completionHandler(.success(data.toDomain()))
            case .failure(let err):
                print(err)
            }
        }
    }
    
    
   

    
    
}

