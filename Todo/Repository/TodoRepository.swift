//
//  TodoRepository.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import Foundation
import RealmSwift

protocol TodoRepository {
    func getTodos() -> Results<Todo>
    
    func addTodo(todo: Todo)
}

class TodoRepositoryStub: TodoRepository {
    func getTodos() -> Results<Todo> {
        return try! Realm().objects(Todo.self)
    }
    
    func addTodo(todo: Todo) {
        
    }
}

class TodoRepositoryImpl: TodoRepository {
    func getTodos() -> Results<Todo> {
        return try! Realm().objects(Todo.self)
    }
    
    func addTodo(todo: Todo) {
        
    }
}
