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
                TodoItemView(dto: TodoDto(), onCommitText: { text in
                    viewModel.addTodo(name: text.name)
                }, didTapCheck: { todoDto in
                    
                })
            }
            .navigationTitle("Todos")
            .toolbar(content: {
                Menu(content: {
                    Button(action: {
                        viewModel.sort = .createdAt
                    }) {
                        menuLabel(sort: .createdAt, label: "作成順")
                    }
                    Button(action: {
                        viewModel.sort = .updatedAt
                    }) {
                        menuLabel(sort: .updatedAt, label: "更新順")
                    }
                }, label: {
                    Image(systemName: "arrow.up.arrow.down")
                })
            })
        }
    }
    
    private func menuLabel(sort: Sort, label: String) -> some View {
        viewModel.sort == sort ?
            ViewBuilder.buildEither(first: Label(label, systemImage: "checkmark")):
            ViewBuilder.buildEither(second: Text(label))
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
