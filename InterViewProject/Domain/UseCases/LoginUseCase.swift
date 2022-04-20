//
//  LoginUseCase.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 17.04.2022.
//

import Foundation
protocol LoginUseCaseProtocol{
    func login(userLoginInformation:UserLoginEtity, completionHandler: @escaping (Result<UserAccessToken,Error>) -> Void)
}

final class LoginUseCase{
    
    
    private let authRepo:AuthRepositoryProtocol
    
    
    init(authRepo:AuthRepositoryProtocol){
        self.authRepo = authRepo
    }
    
    
    func login(userLoginInformation:UserLoginEtity, completionHandler: @escaping (Result<UserAccessToken,Error>) -> Void) {
        authRepo.login(userLoginInformation: userLoginInformation, completionHandler: completionHandler)
    }
  
  
}
