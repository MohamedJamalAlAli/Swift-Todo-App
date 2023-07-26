//
//  Todo.swift
//  Todo App
//
//  Created by Mohamed Jamal AlAli on 25/07/2023.
//

import Foundation

struct Todo: Identifiable {
    
    var id = UUID()
    var title : String
    var subtitle = ""
    var isCompleted = false
    
}
