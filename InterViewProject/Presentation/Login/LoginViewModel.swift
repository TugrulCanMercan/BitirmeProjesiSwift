//
//  LoginViewModel.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 15.04.2022.
//

import Foundation
import Combine

import Infrastructure

class LoginViewModel:ObservableObject {
    
    var cancellable = Set<AnyCancellable>()
    
    private let loginUseCase:LoginUseCase
    @Published var showError:Bool = false
    @Published var email:String = ""
    @Published var password:String = ""
    @Published var showHome:Bool = false
    
    @Published var errorObject:ErrorObject?
    
    
    @Published var checkControl:Bool = false
    
    @Published var checkEmail:Bool = false
    
    
    @Published var emailPrompt:String = "hata"
    
    init(){
        self.loginUseCase = DIManager.shared.container.resolve(LoginUseCase.self, name: "LoginUseCaseDI")!
        loginCheck()
    }
    
    
    
    
    func login(){
       
        
                if checkControl {
                    print(password)
                    let userLoginEntity = UserLoginEtity(email: email, password: password)
                    loginUseCase.login(userLoginInformation: userLoginEntity) { result in


                        switch result{

                        case .success(let token):

                            UserDefaults.standard.set(token.token, forKey: "token")
                            UserDefaults.standard.set(token.refreshToken, forKey: "refreshToken")
                            self.showHome = true
                        case .failure(let error):
                            self.errorObject?.errorDescription = error.localizedDescription
                            self.errorObject?.errorImage = "xmark.octagon.fill"
                            print(error)
                        }
                    }
                }else{
                    showError = true
                }
        
        
    }
   
    
    func loginCheck() {
        
        $email
            .debounce(for: .milliseconds(1000), scheduler: RunLoop.main)
            .map { email in
                email.isValidEmail || email == ""
            }
            .sink {[weak self] result in
                guard let self = self else {return}
                
                if !result{
                    self.emailPrompt = "Hatalı mail"
                }else{
                    self.emailPrompt = ""
                }
                self.checkEmail = result
                
            }
            .store(in: &cancellable)
        
        
        
        $email.combineLatest($password).map { (email,password)-> Bool in
            if  email.isValidEmail == true{
                return true
            }else{
                return false
            }
            
            
        }
        .sink {[weak self] result in
            guard let self = self else {return}
            
            self.checkControl = result
        }
        .store(in: &cancellable)
        
    }
    
}
