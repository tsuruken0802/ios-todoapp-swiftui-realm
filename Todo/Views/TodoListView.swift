//
//  TodoListView.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import SwiftUI
import RealmSwift

struct TodoListView: View {
    @ObservedObject private var viewModel: TodoListViewModel = TodoListViewModel(repository: TodoRepositoryImpl())
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.todos) { todo in
                    TodoItemView(todo: todo) { dto in
                        viewModel.updateTodo(todo: todo, dto: dto)
                    } didTapCheck: { todoDto in
                        
                    }
                }
                TodoItemView(todo: Todo(), onCommitText: { text in
                    viewModel.addTodo(name: text.name)
                }, didTapCheck: { todoDto in
                    
                })
            }
            .navigationTitle("Todos")
            .toolbar(content: {
                ToolbarItemGroup {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus.circle")
                    })
                }
            })
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
