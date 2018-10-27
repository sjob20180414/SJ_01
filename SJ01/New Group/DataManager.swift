//
//  DataManager.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/04/14.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import Foundation

class DataManager {
    
//    func fetchUser(completion: ((Bool, UserObject?) -> Void)?) {
//        RemoteDataManager.sendApi(url: TEST, data: self.createAccessData(), completion: {(success, data) in
//            if success {
//                let jsonUserData = data as! Array<NSDictionary>
////                let users: [UserObject]? = UserObject().mapArray(JSONObject: jsonUserData)
//                completion!(true, /*users?.first*/ nil)
//            } else {
//                completion!(false, nil)
//            }
//        })
//    }
//    
//    func fetchGmailList(accessToken: String, completion: ((Bool) -> Void)?) {
//        RemoteDataManager.getGmailApi(accessToken: accessToken, completion: {(success, data) in
//            if success {
//                let jsonUserData = data
//                completion!(true)
//            } else {
//                completion!(false)
//            }
//        })
//    }
    
    func createAccessData() -> [String: Any] {
        let data = [
            "key": [
                "key": "key",
                "access_token": "uuid"
        ]]
        return data
    }
}
