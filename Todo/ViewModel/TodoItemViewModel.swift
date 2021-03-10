//
//  TodoItemViewModel.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import Foundation

class TodoItemViewModel: ObservableObject, Identifiable {
    let id: UUID = UUID()
    let todo: Todo
    @Published var text: String
    let didTapCheck: () -> Void
    let onCommitText: (_ text: String) -> Void
    
    init(todo: Todo, didTapCheck: @escaping () -> Void, onCommitText: @escaping (_ text: String) -> Void) {
        self.todo = todo
        self._text = Published<String>(initialValue: todo.name)
        self.didTapCheck = didTapCheck
        self.onCommitText = onCommitText
    }
}
