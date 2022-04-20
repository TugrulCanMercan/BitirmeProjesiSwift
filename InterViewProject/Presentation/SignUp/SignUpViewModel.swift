//
//  SignUpViewModel.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.04.2022.
//

import Foundation


final class SignUpViewModel:ObservableObject{
    
    private let signUpUseCase:SignUpUseCase? = DIManager.shared.container.resolve(SignUpUseCase.self, name: "SignUpUseCaseDI")
    
    @Published var name:String = ""
    @Published var surname:String = ""
    @Published var passwrod:String = ""
    @Published var email:String = ""
    
    @Published var successPushLogin:Bool = false
    @Published var handleView:ErrorObject? = nil
    @Published var showError:Bool = false
    
    
    func signUp(){
        
        let userSignUp = UserSignUpEntity(name: name,
                                          surname: surname,
                                          password: passwrod,
                                          email: email)
        signUpUseCase?.signUp(userSignUpInformation: userSignUp, completionHandler: { [self] result in
            switch result{
                
            case .success(let data):
                print(data.message)
                successPushLogin = true
            case .failure(let err):
                self.handleView?.errorDescription = err.localizedDescription
                self.handleView?.errorImage = "person"
            }
        })
    }
    
    
    
}
