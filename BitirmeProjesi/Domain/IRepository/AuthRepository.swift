//
//  LoginUseCase.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 17.04.2022.
//

import Foundation
import Combine

protocol AuthRepository{
    
    func login(userName:String,password:String)-> AnyPublisher<UserAccessToken, Error>
    
}
