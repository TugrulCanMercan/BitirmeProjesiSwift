//
//  Weak.swift
//  DepedencyContainer
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 17.04.2022.
//

import Foundation


public class Weak:Equatable{
   
    
    
    weak var value:AnyObject?
    
    init(value:AnyObject){
        self.value = value
    }
    public static func == (lhs: Weak, rhs: Weak) -> Bool {
        return lhs.value === rhs.value
    }
    
}

