//
//  Task+Convenience.swift
//  Task-CoreData
//
//  Created by Johnathan Aviles on 1/19/21.
//

import CoreData

extension Task {
    convenience init(name: String, notes:String, dueDate: Date, isComplete: Bool, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
    }
    
//    func add(taskWithName name: String, notes: String?, due: Date?) {
//        
//    }
//    
//    func update(task: Task, name: String, notes: String?, due: Date?) {
//        
//    }
//    
//    func remove(task: Task) {
//        
//    }
//    
//    func fetchTasks() {
//        
//    }
}
