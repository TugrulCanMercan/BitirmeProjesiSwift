//
//  UserRepositoryProtocol.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.04.2022.
//

import Foundation


protocol UserRepositoryProtocol{
    
    func getUserInfo(completionHandler:  @escaping (Result<UserInfo, Error>) -> Void)
    
}
