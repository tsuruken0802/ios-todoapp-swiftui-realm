//
//  TodoItemViewModel.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import SwiftUI
import RealmSwift

class TodoItemViewModel: ObservableObject {
    @Published var todoDto: TodoDto
    
    init(todo: Todo) {
        self._todoDto = Published<TodoDto>(initialValue: TodoDto(name: todo.name, done: todo.done))
    }
    
    init(dto: TodoDto) {
        self._todoDto = Published<TodoDto>(initialValue: dto)
    }
}
