//
//  ExamDraftListRepository.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 20.05.2022.
//

import Foundation
import CoreData



class ExamDraftListRepository{
    lazy var persistentContainer: NSPersistentContainer = {
      // 2
      let container = NSPersistentContainer(name: "FaveFlicks")
      // 3
      container.loadPersistentStores { _, error in
        // 4
        if let error = error as NSError? {
          // You should add your own error handling code here.
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
      }
      return container
    }()
}

