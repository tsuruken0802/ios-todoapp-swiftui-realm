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
                ForEach(viewModel.todos, id: \.id) { todo in
                    TodoItemView(todo: todo)
                }
            }
            .navigationTitle("Todos")

        }
        .navigationBarItems(trailing: Button(action: {}, label: {
            Text("Button")
        }))
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
