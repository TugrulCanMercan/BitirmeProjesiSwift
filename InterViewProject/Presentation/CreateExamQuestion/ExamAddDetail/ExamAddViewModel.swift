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
    @Published var entity:[ExamEntity] = []
    
    var persistant = ExamDraftListRepository()
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
            self.persistant.addExam(questionList: list)
            self.allQuestion = list
        }
        .store(in: &cancellable)
    
    }
    
    func getExam() {
        entity = self.persistant.fetchExam()
        entity.forEach{ exam in
            if let entit = exam.questions?.allObjects as? [QuestionEntity] {
                entit.forEach { q in
                    print(q.questionContent)
                }
            }
        }
    }
    
}
