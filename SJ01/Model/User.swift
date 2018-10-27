//
//  User.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/04/14.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import RealmSwift
//import ObjectMapper

class User: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    
    @objc dynamic var googleUserID = ""
    @objc dynamic var googleFullName = ""
    @objc dynamic var googleIdToken = ""
    @objc dynamic var googleName = ""
    @objc dynamic var googleGivenName = ""
    @objc dynamic var googleFamilyName = ""
    @objc dynamic var googleEmail = ""
    
    @objc dynamic var createdAt = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func insertOrUpdate () {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(self, update: true)
        }
    }
}

//class UserObject: Mappable {
//    
//    var id = ""
//    var name = ""
//    
//    var googleUserID = ""
//    var googleFullName = ""
//    var googleIdToken = ""
//    var googleName = ""
//    var googleGivenName = ""
//    var googleFamilyName = ""
//    var googleEmail = ""
//    
//    var createdAt = 0
//    
//    required init?(map: Map) {
//    }
//    
//    func mapping(map: Map) {
//        id <- map["id"]
//        name <- map["name"]
//        
//        createdAt <- map["created_at"]
//    }
//}

