//
//  ExamAddViewModel.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 14.05.2022.
//

import Foundation

import Combine

class ExamQuestionViewModel:ObservableObject{
    
    @Published var category:[String] = ["Swift","TypeScript"]
    @Published var selectedPickere:String = ""
    @Published var questionContent:String = ""
    @Published var quesitons:[String] = []
    @Published var questionAnswer:String = ""
    
    
    @Published var saveButtonDisabled = true
    
    
    @Published var questionList:[Question] = [Question(selectedPickere:"",questionContent: "dsa", questionOptions: ["":""], questionAnswer: "dsads")]
    
    var cancellable = Set<AnyCancellable>()
    
  
    
    init(){
        
        $quesitons
            .map({ val -> Bool in
                
                let check = val.allSatisfy { str in
                    !str.isEmpty
                }
                
                if val.count >= 5 && check {
                    return false
                }else{
                    return true
                }
            })
            .sink { [weak self] val in
            
                guard let self = self else {return }
                self.saveButtonDisabled = val
           
        }.store(in: &cancellable)
        
        
    }
    
    func examAddQuestion(){
        var questionOptions:[String:String] = [:]
        for item in quesitons.indices{
            questionOptions[QuestionOptions.options(item).result] = quesitons[item]
        }

        let question = Question(selectedPickere: selectedPickere, questionContent: questionContent, questionOptions: questionOptions, questionAnswer: selectedPickere)
        
        questionList.append(question)
        
        
    }
    
    func getCategory(){
        
        if !saveButtonDisabled {
            var questionOptions:[String:String] = [:]
            for item in quesitons.indices{
                questionOptions[QuestionOptions.options(item).result] = quesitons[item]
            }

            let question = Question(selectedPickere: selectedPickere, questionContent: questionContent, questionOptions: questionOptions, questionAnswer: selectedPickere)
            
            print(question)
        }
    }
}
