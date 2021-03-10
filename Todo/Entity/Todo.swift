//
//  Todo.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import Foundation

struct Todo {
    var id: String = UUID().uuidString
    var name: String = ""
    var done: Bool = false
}