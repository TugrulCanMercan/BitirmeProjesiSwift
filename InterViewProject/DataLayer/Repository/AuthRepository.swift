//
//  AuthRepository.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 19.04.2022.
//

import Foundation
import Infrastructure


class AuthRepository{
    let networkService:DataTransferService
    
    init(networkService:DataTransferService){
        self.networkService = networkService
    }
}

extension AuthRepository:AuthRepositoryProtocol{
    func login(userLoginInformation: UserLoginEtity, completionHandler: @escaping (Result<UserAccessToken, Error>) -> Void) {
        let endpoint = APIEndpoints.loginUser(userLoginDto: UserLoginRequestDTO(email: userLoginInformation.email,
                                                                                password: userLoginInformation.password))
        networkService.request(with: endpoint) { result in
            switch result{
                
            case .success(let data):
                completionHandler(.success(data.toDomain()))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func signUp(userSignUpInformation: UserSignUpEntity, completionHandler: @escaping (Result<ResponseMessage, Error>) -> Void) {
        let endpoint = APIEndpoints.signUpUser(userSignUp: UserSignUpDTO(name: userSignUpInformation.name,
                                                                         surname: userSignUpInformation.surname,
                                                                         password: userSignUpInformation.password,
                                                                         email: userSignUpInformation.email))
        networkService.request(with: endpoint) { result in
            switch result{
            case .success(let data):
                completionHandler(.success(data.toDomain()))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}



