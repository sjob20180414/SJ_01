//
//  DataManager.swift
//  Summary
//
//  Created by 松井康太郎 on 2017/10/08.
//  Copyright © 2017年 松井康太郎. All rights reserved.
//

import Foundation

class DataManager {
    
    func fetchUser(completion: ((Bool, UserObject?) -> Void)?) {
        RemoteDataManager.sendApi(url: TEST, data: self.createAccessData(), completion: {(success, data) in
            if success {
                let jsonUserData = data as! Array<NSDictionary>
//                let users: [UserObject]? = UserObject().mapArray(JSONObject: jsonUserData)
                completion!(true, /*users?.first*/ nil)
            } else {
                completion!(false, nil)
            }
        })
    }
    
    func createAccessData() -> [String: Any] {
        let data = [
            "key": [
                "key": "key",
                "access_token": "uuid"
        ]]
        return data
    }
}
