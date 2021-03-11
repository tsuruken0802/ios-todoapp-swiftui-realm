//
//  TodoItemViewModel.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import SwiftUI
import RealmSwift

class TodoItemViewModel: ObservableObject {
    @ObservedRealmObject var todo: Todo
    @Published var inputText: String
    
    init(todo: ObservedRealmObject<Todo>) {
        self._todo = todo
        self._inputText = Published<String>(initialValue: todo.wrappedValue.name)
    }
}
