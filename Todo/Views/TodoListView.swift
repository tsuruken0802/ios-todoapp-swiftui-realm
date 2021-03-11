//
//  TodoListView.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import SwiftUI
import RealmSwift

struct TodoListView: View {
//    @ObservedObject private var viewModel: TodoListViewModel = TodoListViewModel(repository: TodoRepositoryImpl())
    @ObservedResults(Todo.self) var todos
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos) { todo in
                    TodoItemView(todo: ObservedRealmObject<Todo>(wrappedValue: todo)) { text in
                        
                    } didTapCheck: {

                    }
                }
                TodoItemView(todo: ObservedRealmObject<Todo>(wrappedValue: Todo()), onCommitText: { text in
                    $todos.append(Todo(name: text, done: false))
                }, didTapCheck: {
                    
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
