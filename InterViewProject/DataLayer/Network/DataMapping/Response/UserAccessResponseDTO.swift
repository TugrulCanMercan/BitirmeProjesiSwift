//
//  UserAccessResponseDTO.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 17.04.2022.
//

import Foundation


struct UserAccessResponseDTO:Codable{
    
    let accessToken:String
    let refreshToken:String
}

extension UserAccessResponseDTO{
    
    
    func toDomain() -> UserAccessToken{
        .init(token: accessToken, refreshToken: refreshToken)
    }
}
