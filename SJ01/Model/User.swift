//
//  User.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/04/14.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import RealmSwift
import ObjectMapper

class User: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var createdAt = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class UserObject: Mappable {
    
    var id = 0
    var name = ""
    var createdAt = 0
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        createdAt <- map["created_at"]
    }
}

