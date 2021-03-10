//
//  TodoListView.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import SwiftUI

struct TodoListView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< 3) { _ in
                    TodoItemView()
                }
            }
            .navigationTitle("Todos")
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
