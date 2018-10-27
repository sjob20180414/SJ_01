//
//  WeeklyReport.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/08/04.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import RealmSwift
//import ObjectMapper

class WeeklyReportItem: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var order = 0
    @objc dynamic var title = ""
    @objc dynamic var inputType = InputType.text.rawValue
    @objc dynamic var text = ""
    @objc dynamic var createdAt = 0
    @objc dynamic var updatedAt = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

enum InputType: Int {
    case titleOmly = 0
    case titleAndText = 1
    case titleAndNumber = 2
    case text = 3
    case number = 4
}

//class WeeklyReportItemObject: Mappable {
//    
//    var id = ""
//    var order = 0
//    var title = ""
//    var inputType = InputType.text.rawValue
//    var text = ""
//    var createdAt = 0
//    var updatedAt = 0
//    
//    required init?(map: Map) {
//    }
//    
//    func mapping(map: Map) {
//        id <- map["id"]
//        order <- map["order"]
//        title <- map["title"]
//        inputType <- map["inputType"]
//        text <- map["text"]
//        createdAt <- map["created_at"]
//        updatedAt <- map["updated_at"]
//    }
//}
