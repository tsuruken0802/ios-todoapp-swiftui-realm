//
//  TodoItemView.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import SwiftUI

struct TodoItemView: View {
    @ObservedObject var viewModel: TodoItemViewModel
    var onCommitText: (_ text: String) -> Void
    var didTapCheck: () -> Void
    
    init(todo: Todo, onCommitText: @escaping (_ text: String) -> Void, didTapCheck: @escaping () -> Void) {
        self.viewModel = TodoItemViewModel(todo: todo)
        self.onCommitText = onCommitText
        self.didTapCheck = didTapCheck
    }
    
    var body: some View {
        HStack {
            TextField("Todoを入力してください", text: $viewModel.todo.name, onCommit: {
                onCommitText(viewModel.todo.name)
            })
            Spacer()
            CheckBox(isChecked: viewModel.todo.done, didTap: {
                didTapCheck()
            })
        }
        .padding()
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(todo: Todo(), onCommitText: {_ in }, didTapCheck: {})
    }
}
