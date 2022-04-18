//
//  BitirmeProjesiApp.swift
//  BitirmeProjesi
//
//  Created by Tuğrulcan on 8.04.2022.
//

import SwiftUI
import DepedencyContainer
@main
struct BitirmeProjesiApp: App {
   
    
    
    
    let dependencyManager = DependencyManager()
    
    var body: some Scene {
        WindowGroup {
            UserInformationSectionView()
        }
    }
}
