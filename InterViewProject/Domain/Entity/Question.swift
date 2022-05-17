//
//  Question.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 28.04.2022.
//

import Foundation

struct Question:Hashable{
    
    
    var selectedPickere:String
    var questionContent:String
    var questionOptions:[String:String]
    var questionAnswer:String
    
    
}

extension Question{
    func options(){
        
    }
}
