//
//  TodoManager.swift
//  Todo App
//
//  Created by Mohamed Jamal AlAli on 01/08/2023.
//

import Foundation

import SwiftUI

class TodoManager: ObservableObject {
    @Published var todos : [Todo] = [] {
        didSet {
            save()
        }
    }
        
    var numTodosDone: Int {
        todos.filter { $0.isCompleted }.count
    }
    var numTodosNotDone: Int {
        todos.filter{ !$0.isCompleted }.count
    }
    
    init() {
        load()
    }
    
    func loadSampleData() {
        todos = Todo.sampleTodos
    }
    
    func getArchiveURL() -> URL {
        let plistName = "todos.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedTodos = try? propertyListEncoder.encode(todos)
        try? encodedTodos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        print(archiveURL)
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedTodoData = try? Data(contentsOf: archiveURL),
            let todosDecoded = try? propertyListDecoder.decode([Todo].self, from: retrievedTodoData) {
            todos = todosDecoded
        }
    }
}
