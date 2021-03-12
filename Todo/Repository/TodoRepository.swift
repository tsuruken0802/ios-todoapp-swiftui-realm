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
    
    func updateTodo(todo: Todo, dto: TodoDto)
    
    func delete(todo: Todo)
}

class TodoRepositoryImpl: TodoRepository {
    func getTodos() -> Results<Todo> {
        return try! Realm().objects(Todo.self)
    }
    
    func addTodo(todo: Todo) {
        let realm: Realm = try! .init()
        try! realm.write {
            realm.add(todo, update: .all)
        }
    }
    
    func updateTodo(todo: Todo, dto: TodoDto) {
        let realm: Realm = try! .init()
        try! realm.write {
            todo.name = dto.name
            todo.done = dto.done
        }
    }
    
    func delete(todo: Todo) {
        let realm: Realm = try! .init()
        try! realm.write {
            realm.delete(todo)
        }
    }
}
