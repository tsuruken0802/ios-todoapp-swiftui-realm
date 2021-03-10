//
//  TodoListViewModel.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import Combine

class TodoListViewModel: ObservableObject {
    let repository: TodoRepository
    @Published var todos: [Todo] = []
    
    init(repository: TodoRepository) {
        self.repository = repository
        loadTodos()
    }
}

extension TodoListViewModel {
    private func loadTodos() {
        todos = repository.getTodos()
    }
}
