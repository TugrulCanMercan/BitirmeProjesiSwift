//
//  QuestionExamRepositoryProtocol.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 29.04.2022.
//

import Foundation


protocol QuestionExamRepositoryProtocol{
    
    func addQuestion(question:Question,completionHandler: @escaping (Result<Question,Error>) -> Void)
        
    func addExam(question:Question,completionHandler: @escaping (Result<Question,Error>) -> Void)
    
    func getCategoryList(categoryList:[String],completionHandler: @escaping (Result<Question,Error>) -> Void)
    
    
}
