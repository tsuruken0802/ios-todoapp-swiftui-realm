//
//  Todo.swift
//  Todo
//
//  Created by 鶴本賢太朗 on 2021/03/10.
//

import Foundation
import RealmSwift

class Todo: Object, ObjectKeyIdentifiable {
    @objc dynamic var _id = ObjectId.generate()
    @objc dynamic var name: String = ""
    @objc dynamic var done: Bool = false
    
    init(name: String, done: Bool) {
        self.name = name
        self.done = done
    }
    
    override init() {
    }
    
    override class func primaryKey() -> String? {
        "_id"
    }
}
