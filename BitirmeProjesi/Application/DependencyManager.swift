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
    
    
    
    //    @Dependency var config: ApiDataNetworkConfig
//    @Dependency var baseService:DefaultNetworkService
    //    @Dependency var service:DefaultDataTransferService
    
    init(){
        loadDependency()
    }
    //    let configration:NetworkConfigurable = ApiDataNetworkConfig(baseURL: URL(string: "https://new-english-app.herokuapp.com/"))
    //    let baseService:NetworkService = DefaultNetworkService(config: <#T##NetworkConfigurable#>)
    //    let service:DataTransferService = DefaultDataTransferService(with: <#T##NetworkService#>)
    
    func loadDependency(){
        
        let configration:NetworkConfigurable = ApiDataNetworkConfig(baseURL: URL(string: "https://new-english-app.herokuapp.com/")!)
        let baseService:NetworkService = DefaultNetworkService(config: configration)
        let service:IsDependency = DefaultDataTransferService(with: baseService)
        
        
        
        
    }
    
    
}
