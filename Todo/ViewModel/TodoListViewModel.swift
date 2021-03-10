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
    
    func didTapCheck(index: Int) {
        
    }
    
    func onCommitText(index: Int) {
        
    }
}

extension TodoListViewModel {
    private func loadTodos() {
        todos.removeAll()
        self.todos = repository.getTodos().enumerated().map { [unowned self] (todo) -> TodoItemViewModel in
            TodoItemViewModel(todo: todo.element) {
                self.didTapCheck(index: todo.offset)
            } onCommitText: {
                self.onCommitText(index: todo.offset)
            }
        }
    }
}
