//
//  GetUserUseCase.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.04.2022.
//

import Foundation


protocol GetUserUseCaseProtocol{
    func login(userLoginInformation:UserLoginEtity, completionHandler: @escaping (Result<UserAccessToken,Error>) -> Void)
}

final class GetUserUseCase{
    
    
    private let userRepo:UserRepositoryProtocol
    
    
    init(userRepo:UserRepositoryProtocol){
        self.userRepo = userRepo
    }
    
    
    
    func getUser(completionHandler: @escaping (Result<UserInfo,Error>) -> Void){
        userRepo.getUserInfo(completionHandler: completionHandler)
    }
  
}

