//
//  TodoListViewModel.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import Combine

class TodoListViewModel: ObservableObject {
    let repository: TodoRepository
    @Published var todos: [TodoItemViewModel] = []
    
    init(repository: TodoRepository) {
        self.repository = repository
        loadTodos()
    }
    
    func addTodo(name: String) {
        let todo: Todo = .init(name: name, done: false)
        repository.addTodo(todo: todo)
        todos.append(TodoItemViewModel(todo: todo, didTapCheck: { [weak self] in
            guard let self = self else { return }
            self.didTapCheck(index: self.todos.count - 1)
        }, onCommitText: { text in
            self.onCommitText(index: self.todos.count - 1, text: text)
        }))
    }
    
    func didTapCheck(index: Int) {
        
    }
    
    func onCommitText(index: Int, text: String) {
        
    }
}

extension TodoListViewModel {
    private func loadTodos() {
        todos.removeAll()
        self.todos = repository.getTodos().enumerated().map { [unowned self] (todo) -> TodoItemViewModel in
            TodoItemViewModel(todo: todo.element) {
                self.didTapCheck(index: todo.offset)
            } onCommitText: { text in
                self.onCommitText(index: todo.offset, text: text)
            }
        }
    }
}
