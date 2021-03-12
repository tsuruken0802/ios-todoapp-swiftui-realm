//
//  TodoListViewModel.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import Combine
import RealmSwift

class TodoListViewModel: ObservableObject {
    private let repository: TodoRepository
    private(set) var todos: Results<Todo>
    private var notificationToken: NotificationToken?
     var objectWillChange: ObservableObjectPublisher = .init()

    init(repository: TodoRepository) {
        self.repository = repository
        todos = repository.getTodos()
        initNotification()
    }
    
    deinit {
        notificationToken?.invalidate()
    }

    func addTodo(name: String) {
        repository.addTodo(todo: .init(name: name, done: false))
    }
    
    func updateTodo(todo: Todo, dto: TodoDto) {
        repository.updateTodo(todo: todo, dto: dto)
    }
    
    func deleteTodo(index: Int) {
        if index < 0 || index >= todos.count { return }
        repository.delete(todo: todos[index])
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
