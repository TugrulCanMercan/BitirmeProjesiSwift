//
//  UserRepository.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 15.04.2022.
//

import Foundation
import Infrastructure
import DepedencyContainer

import Combine


class UserRepository{
    
    
    
    
    @Inject var dataTransferService:DefaultDataTransferService

   
    var cancellable = Set<AnyCancellable>()
    
    init(){
        login(userName: "", password: "")
    }
   
    

}


struct English:Codable{
    
    let Word:String
    let turkish:String
}


extension UserRepository{
    func login(userName: String, password: String)  {
        let endpoint = APIEndpoints.english()
        dataTransferService.request(with: endpoint) { result in
            switch result{

            case .success(let res):
                print(res)
            case .failure(let err):
                print(err)
            }
        }?.resume()


    }
}
