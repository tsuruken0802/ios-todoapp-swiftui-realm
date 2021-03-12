//
//  TodoItemView.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import SwiftUI
import RealmSwift

struct TodoItemView: View {
    @ObservedObject var viewModel: TodoItemViewModel
    var onCommitText: (_ todoDto: TodoDto) -> Void
    var didTapCheck: (_ todoDto: TodoDto) -> Void
    
    init(todo: Todo, onCommitText: @escaping (_ todoDto: TodoDto) -> Void, didTapCheck: @escaping (_ todoDto: TodoDto) -> Void) {
        self.viewModel = TodoItemViewModel(todo: todo)
        self.onCommitText = onCommitText
        self.didTapCheck = didTapCheck
    }
    
    var body: some View {
        HStack {
            TextField("Todoを入力してください", text: $viewModel.todoDto.name, onCommit: {
                onCommitText(viewModel.todoDto)
            })
            Spacer()
            CheckBox(isChecked: viewModel.todoDto.done, didTap: {
                didTapCheck(viewModel.todoDto)
            })
        }
        .padding()
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(todo: Todo(), onCommitText: {_ in }, didTapCheck: {_ in })
    }
}
