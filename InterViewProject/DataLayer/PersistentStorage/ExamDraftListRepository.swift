//
//  ExamDraftListRepository.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.05.2022.
//

import Foundation
import CoreData

protocol Repository {
    /// The entity managed by the repository.
    associatedtype Entity

    /// Gets an array of entities.
    /// - Parameters:
    ///   - predicate: The predicate to be used for fetching the entities.
    ///   - sortDescriptors: The sort descriptors used for sorting the returned array of entities.
    func get(predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?) -> Result<[Entity], Error>

    /// Creates an entity.
    func create() -> Result<Entity, Error>

    /// Deletes an entity.
    /// - Parameter entity: The entity to be deleted.
    func delete(entity: Entity) -> Result<Bool, Error>
}



class ExamDraftListRepository{
    
   
    
    
    lazy var persistentContainer: NSPersistentContainer = {
      
      let container = NSPersistentContainer(name: "ExamDraftContainer")
      
      container.loadPersistentStores { _, error in
        
        if let error = error as NSError? {
          
            print("Core data yüklenemedi")
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }else{
            print("Core data yüklendi")
        }
      }
      return container
    }()
    
    
    func fetchObject<T:NSManagedObject>(entity:T.Type, predicate:NSPredicate? = nil, sortDescription: [NSSortDescriptor]? = nil, context:NSManagedObjectContext){
        
    }
    
    func fetchExam() -> [ExamEntity]{
        let request = NSFetchRequest<ExamEntity>(entityName: "ExamEntity")
        var examList:[ExamEntity] = []
        do {
            examList = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print(error)
        }
        return examList
    }
    
    func addExam(questionList:[TTQuestion]) {
        let exam = ExamEntity(context: persistentContainer.viewContext)
        
        questionList.forEach { ttquestion in
            let questions = QuestionEntity(context: persistentContainer.viewContext)
            exam.examName = "Tugrul Sınavı"
            questions.questionAnswer = ttquestion.questionAnswer
            questions.quesitons = ttquestion.quesitons
            questions.questionContent = ttquestion.questionContent
            questions.category = ttquestion.category
            questions.selectedPicker = ttquestion.selectedPicker
            exam.addToQuestions(questions)
        }
        saveData()
    }
    func saveData() {
        do {
            try persistentContainer.viewContext.save()
        } catch let err {
            print("kayıt hatası \(err)")
        }
        
    }
    
}

