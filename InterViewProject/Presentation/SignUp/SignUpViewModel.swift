//
//  SignUpViewModel.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.04.2022.
//

import Foundation
import Combine

struct FormSignUpMessage{
    var nameMessage:String
    var surname:String
    var password:String
    var email:String
}

enum FormSignUpMessageYeni{
    case nameMessage(param:Bool)
    case surname(param:Bool)
    case password(param:Bool)
    case email(param:Bool)
    
    
    static func getMessage(message:Self) -> String {
        
        
        switch message{
        case .nameMessage(param: let param):
            if param{
                return ""
            }else{
                return "İsim alanı boş olamaz"
            }
        case .surname(param: let param):
            if param{
                return ""
            }else{
                return "Soyad alanı boş olamaz"
            }
           
        case .password(param: let param):
            if param{
                return ""
            }else{
                return "Şifre alanı boş olamaz"
            }
        case .email(param: let param):
            if param{
                return ""
            }else{
                return "Email formata Uymuyor"
            }
        }
    }
}



final class SignUpViewModel:ObservableObject{
    
    private let signUpUseCase:SignUpUseCase? = DIManager.shared.container.resolve(SignUpUseCase.self, name: "SignUpUseCaseDI")
    var cancellable = Set<AnyCancellable>()
    @Published var name:String = ""
    @Published var surname:String = ""
    @Published var password:String = ""
    @Published var email:String = ""
    
    var nameValid:Bool = false
    var surnameValid:Bool = false
    var passwordValid:Bool = false
    var emailValid:Bool = false
    
    
    var nameİsvalid:Bool = false
    lazy var a = [nameİsvalid]
    
    @Published var successPushLogin:Bool = false
    @Published var handleView:ErrorObject? = nil
    @Published var showError:Bool = false
    @Published var formSignUpMessage = FormSignUpMessage(nameMessage: "", surname: "", password: "", email: "")
    
//    var isValid: AnyPublisher<Bool, Never> {
//            Publishers
//                .CombineLatest4($nameValid, $surnameValid, $passwordValid, $emailValid)
//                .allSatisfy { email, name, surname, password in
//                    email == name && surname == password
//                }.eraseToAnyPublisher()
//    }
    
    init(){
        validationControl()
        
    }
    
    private func validationControl(){
        
        $name.map(emptyControl(str: ))
            .sink { result in
                self.nameİsvalid = result
                
                    self.formSignUpMessage.nameMessage = FormSignUpMessageYeni.getMessage(message: .nameMessage(param: result))
 
            }
            .store(in: &cancellable)
        
        
        
        $surname.map(emptyControl(str:))
            .sink { result in
                self.surnameValid = result
                self.formSignUpMessage.surname = FormSignUpMessageYeni.getMessage(message: .surname(param: result))
                
            }
            .store(in: &cancellable)
        
        
        $password.map(emptyControl(str: ))
            .sink { result in
                self.passwordValid = result
                self.formSignUpMessage.password = FormSignUpMessageYeni.getMessage(message: .password(param: result))
                
            }
            .store(in: &cancellable)
        $email.map { str in
            return str.isValidEmail
        }
        .sink(receiveValue: { result in
            self.emailValid = result
            self.formSignUpMessage.email = FormSignUpMessageYeni.getMessage(message: .email(param: result))
        })
        .store(in: &cancellable)
        
        
        
        
        
        
    }
    private func emptyControl(str:String)->Bool{
        
        
        return str.isEmpty ? false : true
    }
    
    
    
    func signUp(){
        
        if nameİsvalid && surnameValid && emailValid && passwordValid{
            let userSignUp = UserSignUpEntity(name: name,
                                              surname: surname,
                                              password: password,
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
    
    
    
}

