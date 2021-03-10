//
//  TodoItemView.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import SwiftUI

struct TodoItemView: View {
    let todo: Todo
    
    var body: some View {
        HStack {
            Text(todo.name)
            Spacer()
            CheckBox(isChecked: todo.done, didTap: {
                
            })
        }
        .padding()
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(todo: Todo(name: "買い物をする", done: true))
            .frame(height: 80, alignment: .center)
    }
}
