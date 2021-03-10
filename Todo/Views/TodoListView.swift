//
//  TodoListView.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject private var viewModel: TodoListViewModel = TodoListViewModel(repository: TodoRepositoryStub())
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.todos) { viewModel in
                    TodoItemView(viewModel: viewModel)
                }
                TodoItemView(viewModel: .init(todo: Todo(), didTapCheck: {
                    
                }, onCommitText: { text in
                    viewModel.addTodo(name: text)
                }))
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
