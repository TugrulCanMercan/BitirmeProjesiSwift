//
//  LoginUseCase.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 17.04.2022.
//

import Foundation
import Combine

protocol AuthRepositoryProtocol{
    
    func login(userLoginInformation:UserLoginEtity,completionHandler:  @escaping (Result<UserAccessToken, Error>) -> Void)
    
    
    func signUp(userSignUpInformation:UserSignUpEntity,completionHandler:  @escaping (Result<ResponseMessage, Error>) -> Void)
    
    
    
}


struct ResponseMessage{
    
    let message:String
    
}
