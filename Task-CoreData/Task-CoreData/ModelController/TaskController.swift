//
//  TaskController.swift
//  Task-CoreData
//
//  Created by Johnathan Aviles on 1/19/21.
//

import CoreData

class TaskController {
    static let shared = TaskController()
    
    var tasks: [Task] = []
    
    // Fetch Request
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    func createTaskWith(name: String, notes: String?, dueDate: Date?){
        Task(name: name, notes: notes ?? "", dueDate: dueDate ?? Date(), isComplete: false)
        CoreDataStack.saveContext()
    }
    
    func fetchTasks(){
        tasks = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        
    }
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?){
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        CoreDataStack.saveContext()
    }
    
    func toggleIsComplete(task: Task){
        task.isComplete = !task.isComplete
        CoreDataStack.saveContext()
    }
    
    func deleteTask(task: Task) {
        guard let index = tasks.firstIndex(of: task) else { return }
        tasks.remove(at: index)
        CoreDataStack.context.delete(task)
        CoreDataStack.saveContext()
    }
}
