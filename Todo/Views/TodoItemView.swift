//
//  TodoItemView.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import SwiftUI

struct TodoItemView: View {
    let viewModel: TodoItemViewModel
    @State var text: String
    
    init(viewModel: TodoItemViewModel) {
        self.viewModel = viewModel
        self._text = State<String>(initialValue: viewModel.todo.name)
    }
    
    var body: some View {
        HStack {
            TextField("Todoを入力してください", text: $text, onCommit: viewModel.onCommitText)
            Spacer()
            CheckBox(isChecked: viewModel.todo.done, didTap: viewModel.didTapCheck)
        }
        .padding()
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TodoItemViewModel(todo: Todo()) {
            
        } onCommitText: {
                
        }
        TodoItemView(viewModel: viewModel)
    }
}
