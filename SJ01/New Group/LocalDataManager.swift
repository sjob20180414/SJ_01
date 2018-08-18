//
//  LocalDataManager.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/04/14.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import Foundation
import RealmSwift

class LocalDataManager <T : RealmSwift.Object> {
    let realm: Realm
    
    init () {
        try! realm = Realm()
    }
    
    func fetchAll () -> Results<T> {
        return realm.objects(T.self)
    }
    
    func fetchFirst () -> T? {
        return fetchAll().first
    }
}


