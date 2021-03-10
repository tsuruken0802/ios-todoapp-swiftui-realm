//
//  TodoItemView.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import SwiftUI

struct TodoItemView: View {
    var body: some View {
        HStack {
            Text("買い物をする")
            Spacer()
            CheckBox(didTap: {})
        }
        .padding()
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView()
            .frame(height: 80, alignment: .center)
    }
}
