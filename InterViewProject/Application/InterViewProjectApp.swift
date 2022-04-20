//
//  InterViewProjectApp.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 19.04.2022.
//

import SwiftUI

@main
struct InterViewProjectApp: App {
    
    let manager  = DIManager.shared
    var body: some Scene {
        WindowGroup {
            
          
            LoginView()
        }
    }
    
    func tokenCheck(){
        if let token:UserAccessToken? = UserDefaults.standard.object(forKey: "token") as? UserAccessToken{
            
        }
        
    }
}
