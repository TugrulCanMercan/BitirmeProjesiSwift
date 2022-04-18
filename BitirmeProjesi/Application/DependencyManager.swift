//
//  ApplicationDependency.swift
//  BitirmeProjesi
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 17.04.2022.
//

import Foundation
import DepedencyContainer
import Infrastructure





class DependencyManager{
    
    

    
    init(){
       loadDependency()
    }

    
    func loadDependency(){
        
        let configration:NetworkConfigurable = ApiDataNetworkConfig(baseURL: URL(string: "https://new-english-app.herokuapp.com/")!)
        let baseService:NetworkService = DefaultNetworkService(config: configration)
        let service = DefaultDataTransferService(with: baseService)
        
        
        let configration1:NetworkConfigurable = ApiDataNetworkConfig(baseURL: URL(string: "https://new-english-app.tugrul.com/")!)
        let baseService1:NetworkService = DefaultNetworkService(config: configration1)
        let service1 = DefaultDataTransferService(with: baseService1)
        let resolver = DIContainer.shared
        resolver.add(service1)
        resolver.add(service1)
        
     
        
        
        
    }
    
    
}

