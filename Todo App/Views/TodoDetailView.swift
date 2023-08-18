//
//  TodoDetailView.swift
//  Todo App
//
//  Created by Mohamed Jamal AlAli on 26/07/2023.
//

import SwiftUI

struct TodoDetailView: View {
    
    @Binding var todo: Todo
    
    var body: some View {
        Form {
            TextField("Title", text: $todo.title)
            TextField("Subtitle", text: $todo.subtitle)
            Toggle("Is Completed?",isOn: $todo.isCompleted)
            
        }
        .navigationTitle("Todo Details")
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            TodoDetailView(todo: .constant(Todo(title: "Feed the cat")))
        }
    }
}
