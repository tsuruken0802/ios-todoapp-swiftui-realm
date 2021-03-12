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
                    if todo.isInvalidated {
                        EmptyView()
                    }
                    else {
                        TodoItemView(todo: todo) { dto in
                            viewModel.updateTodo(todo: todo, dto: dto)
                        } didTapCheck: { dto in
                            viewModel.updateTodo(todo: todo, dto: dto)
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    if let index: Int = indexSet.first {
                        viewModel.deleteTodo(index: index)
                    }
                })
                TodoItemView(dto: TodoDto(), onCommitText: { dto in
                    viewModel.addTodo(dto: dto)
                }, didTapCheck: { todoDto in
                    
                })
            }
            .navigationTitle("Todos")
            .toolbar(content: {
                Menu(content: {
                    Button(action: {
                        viewModel.ascendingOrder = true
                    }) {
                        menuLabel(ascending: true, title: "Ascending Order")
                    }
                    Button(action: {
                        viewModel.ascendingOrder = false
                    }) {
                        menuLabel(ascending: false, title: "Descending Order")
                    }
                }, label: {
                    Image(systemName: "arrow.up.arrow.down")
                })
            })
        }
    }
    
    private func menuLabel(ascending: Bool, title: String) -> some View {
        viewModel.ascendingOrder == ascending ?
            ViewBuilder.buildEither(first: Label(title, systemImage: "checkmark")):
            ViewBuilder.buildEither(second: Text(title))
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
