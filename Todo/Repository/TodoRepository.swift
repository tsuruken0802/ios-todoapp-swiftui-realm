//
//  TodoRepository.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import Foundation
import RealmSwift

protocol TodoRepository {
    func getTodos(sortBy: String, ascending: Bool) -> Results<Todo>
    
    func addTodo(dto: TodoDto)
    
    func updateTodo(todo: Todo, dto: TodoDto)
    
    func delete(todo: Todo)
}

class TodoRepositoryImpl: TodoRepository {
    func getTodos(sortBy: String, ascending: Bool) -> Results<Todo> {
        return try! Realm().objects(Todo.self).sorted(byKeyPath: sortBy, ascending: ascending)
    }
    
    func addTodo(dto: TodoDto) {
        let realm: Realm = try! .init()
        try! realm.write {
            let todo: Todo = .init(name: dto.name, done: dto.done)
            realm.add(todo, update: .all)
        }
    }
    
    func updateTodo(todo: Todo, dto: TodoDto) {
        let realm: Realm = try! .init()
        try! realm.write {
            todo.name = dto.name
            todo.done = dto.done
            todo.updatedAt = Date()
        }
    }
    
    func delete(todo: Todo) {
        let realm: Realm = try! .init()
        try! realm.write {
            realm.delete(todo)
        }
    }
}
