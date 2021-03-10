//
//  TodoItemView.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import SwiftUI

struct TodoItemView: View {
    @ObservedObject var viewModel: TodoItemViewModel
    
    init(viewModel: TodoItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            TextField("Todoを入力してください", text: $viewModel.text, onCommit: {
                viewModel.onCommitText(viewModel.text)
            })
            Spacer()
            CheckBox(isChecked: viewModel.todo.done, didTap: viewModel.didTapCheck)
        }
        .padding()
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel: TodoItemViewModel = .init(todo: Todo()) {
            
        } onCommitText: {_ in
            
        }
        TodoItemView(viewModel: viewModel)
    }
}
