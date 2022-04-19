//
//  LoginViewModel.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 15.04.2022.
//

import Foundation

import Infrastructure

class LoginViewModel:ObservableObject {
    
    private let loginUseCase:LoginUseCase
    
    @Published var userLoginObject = UserLoginEtity(email: "", password: "")
    
    
    
    init(loginUseCase:LoginUseCase){
        self.loginUseCase = loginUseCase
    }
    
    
    func login(){
        
        loginUseCase.login(userLoginInformation: userLoginObject) { token in
            
        }
    }
    
}
