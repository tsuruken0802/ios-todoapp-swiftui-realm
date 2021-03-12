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
    private(set) var todos: Results<Todo>!
    private var notificationToken: NotificationToken?
    private(set) var objectWillChange: ObservableObjectPublisher = .init()

    init(repository: TodoRepository) {
        self.repository = repository
        loadTodos()
        initNotification()
    }

    func addTodo(name: String) {
        repository.addTodo(todo: .init(name: name, done: false))
    }
    
    func updateTodo(todo: Todo, dto: TodoDto) {
        repository.updateTodo(todo: todo, dto: dto)
    }
}

extension TodoListViewModel {
    private func loadTodos() {
        todos = repository.getTodos()
    }
    
    private func initNotification() {
        notificationToken = todos.observe({ [weak self] (change) in
            switch change {
            case .update(_, _, _, _):
                self?.objectWillChange.send()
                break
            default:
                break
            }
        })
    }
}
