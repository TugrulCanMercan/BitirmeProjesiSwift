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
    
    var allQuestion:[TTQuestion] = []
    
    init(){
        
       
        
        
    }
    
    func examAddQuestion(){
        let addQuestionViewModel = AddQuestionViewModel()
        questionList.append(addQuestionViewModel)
        
    }
    
    func addDraftList() {
        $questionList.map { vmList -> [TTQuestion] in
            let qList = vmList.map { vm in
                return vm.ttQuestion
            }
            return qList
        }
        .sink { [weak self] list in
            guard let self = self else { return }
            self.allQuestion = list
        }
        .store(in: &cancellable)
    
    }
    
}
