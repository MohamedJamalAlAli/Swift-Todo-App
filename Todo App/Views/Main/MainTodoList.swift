//
//  MainTodoList.swift
//  Todo App
//
//  Created by Mohamed Jamal AlAli on 16/08/2023.
//

import SwiftUI

struct MainTodoList: View {
    
    @StateObject var todoManager: TodoManager
    @State private var showSheet = false
    @State private var showConfirmAlert = false
    
    
    var body: some View {
        NavigationStack {
            List($todoManager.todos, editActions: [.all]){ $todo in
                TodoRowView(todo: $todo)
            }
         
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading)
                {
                    EditButton()
                }
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    
                    
                    Button {
                        showConfirmAlert = true
                   } label : {
                        Image(systemName: "clipboard")
                    }
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
                
            
            .sheet(isPresented: $showSheet ){
                NewTodoView(sourceArray: $todoManager.todos)
                    .presentationDetents([.medium])
            }
            .alert("Load sample data? Warning: All existing data will be deleted ", isPresented: $showConfirmAlert) {
                
                Button("Replace", role: .destructive) {
                    todoManager.loadSampleData()
                }
            }
                    }
    }
}

struct MainTodoList_Previews: PreviewProvider {
    static var previews: some View {
        MainTodoList(todoManager: TodoManager())
    }
}
