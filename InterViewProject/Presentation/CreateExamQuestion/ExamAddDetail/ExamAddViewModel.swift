//
//  ExamAddViewModel.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 14.05.2022.
//

import Foundation

import Combine

class ExamQuestionViewModel:ObservableObject{

    @Published var questionList:[AddQuestionViewModel] = []
    @Published var examName:String = ""
    var cancellable = Set<AnyCancellable>()
    
  
    
    init(){
        
       
        
        
    }
    
    func examAddQuestion(){
        let addQuestionViewModel = AddQuestionViewModel()
        questionList.append(addQuestionViewModel)
        
    }
    
    func addDraftList() {
        questionList.map { vm in
            
        }
    }
    
}
