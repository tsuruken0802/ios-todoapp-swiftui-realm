//
//  Todo.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import Foundation
import RealmSwift

class Todo: Object {
    @objc dynamic var id = ObjectId.generate()
    @objc dynamic var name: String = ""
    @objc dynamic var done: Bool = false
    
    init(name: String, done: Bool) {
        self.name = name
        self.done = done
    }
    
    override init() {
    }
}
