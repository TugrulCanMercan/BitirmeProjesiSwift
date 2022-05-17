//
//  QuestionExamRepository.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 29.04.2022.
//

import Foundation
import Infrastructure

final class QuestionExamRepository{
    let networkService:DataTransferService
    
    init(networkService:DataTransferService){
        self.networkService = networkService
    }
}


//extension QuestionExamRepository:QuestionExamRepositoryProtocol{
//    func addQuestion(question: Question, completionHandler: @escaping (Result<Question, Error>) -> Void) {
//        
////        let endpoint = 
////        networkService.request(with: <#T##ResponseRequestable#>, completion: <#T##(Result<Decodable, DataTransferError>) -> Void#>)
//    }
//    
//    func addExam(question: Question, completionHandler: @escaping (Result<Question, Error>) -> Void) {
//        
//    }
//    
//    func getCategoryList(categoryList: [String], completionHandler: @escaping (Result<Question, Error>) -> Void) {
//        
//    }
//    
//    
//}
