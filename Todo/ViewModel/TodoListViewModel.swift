//
//  TodoListViewModel.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import Combine
import RealmSwift

class TodoListViewModel: ObservableObject {
    let repository: TodoRepository
    @Published var todos: Results<Todo>!

    init(repository: TodoRepository) {
        self.repository = repository
        loadTodos()
    }

    func addTodo(name: String) {
        repository.addTodo(todo: .init(name: name, done: false))
    }

    func didTapCheck(index: Int) {

    }

    func onCommitText(index: Int, text: String) {

    }
}

extension TodoListViewModel {
    private func loadTodos() {
        self.todos = repository.getTodos()
    }
}
