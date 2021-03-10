//
//  TodoRepository.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import Foundation

protocol TodoRepository {
    func getTodos() -> [Todo]
    
    func addTodo(todo: Todo)
}

class TodoRepositoryStub: TodoRepository {
    func getTodos() -> [Todo] {
        var todos: [Todo] = []
        for i in 0 ..< 10 {
            let todo: Todo = .init(name: "\(i)番目のTodo", done: false)
            todos.append(todo)
        }
        return todos
    }
    
    func addTodo(todo: Todo) {
        
    }
}

