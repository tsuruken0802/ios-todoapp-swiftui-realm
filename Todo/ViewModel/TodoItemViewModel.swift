//
//  TodoItemViewModel.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import Foundation

class TodoItemViewModel: ObservableObject {
    @Published var todo: Todo
    
    init(todo: Todo) {
        self._todo = Published<Todo>(initialValue: todo)
    }
}
