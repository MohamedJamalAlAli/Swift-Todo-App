//
//  How many more view.swift
//  Todo App
//
//  Created by Mohamed Jamal AlAli on 17/08/2023.
//

import SwiftUI

struct How_many_more_view: View {
    
    @ObservedObject var todoManager: TodoManager
    
    var body: some View {
        Text("You have completed ^[\(todoManager.numTodosDone) todos](inflect: true) !")
            .font(.largeTitle)
            .multilineTextAlignment(.center)
        Text("You have ^[\(todoManager.numTodosNotDone) todos](inflect:true) left.")
            .padding()
            
    }
}

struct How_many_more_view_Previews: PreviewProvider {
    static var previews: some View {
        How_many_more_view(todoManager: TodoManager())
    }
}
