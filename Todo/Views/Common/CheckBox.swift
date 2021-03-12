//
//  CheckBox.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import SwiftUI

struct CheckBox: View {
    private static let length: CGFloat = 20
    @Binding<Bool> var isChecked: Bool
    let didTap: () -> Void
    
    // チェックボックスの表示
    var body: some View {
        checkImage
            .onTapGesture {
                isChecked.toggle()
                didTap()
            }
    }
    
    private var checkImage: some View {
        let checkImage: Image = isChecked ? Image(systemName: "checkmark.square") : Image(systemName: "square")
        return checkImage
            .resizable()
            .frame(width: CheckBox.length, height: CheckBox.length)
            .foregroundColor(.black)
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox(isChecked: .constant(true), didTap: {})
    }
}
