//
//  ApiEndpoint.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 15.04.2022.
//

import Foundation
import Infrastructure


struct english:Codable{
    let Word:String
    let turkish:String
    
}

struct APIEndpoints {
    

    static func english() -> Endpoint<[english]>{
        return Endpoint(path: "", method: .get)
    }
    
    
    static func loginUser(userLoginDto:UserLoginRequestDTO)->Endpoint<UserAccessResponseDTO>{
        return Endpoint(path: "auth/signUp", method: .post)
    }
    
    static func signUpUser(userSignUp:UserSignUpDTO)->Endpoint<ResponseMessageDTO>{
        return Endpoint(path: "auth/signUp", method: .post)
    }

}
