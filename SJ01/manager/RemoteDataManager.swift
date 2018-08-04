//
//  RemoteDataManager.swift
//  Summary
//
//  Created by 松井康太郎 on 2017/10/08.
//  Copyright © 2017年 松井康太郎. All rights reserved.
//

import Foundation
import ObjectMapper

class RemoteDataManager {
    static func sendApi(url:String, data: Dictionary<String,Any>, completion: ((Bool, Any?) -> Void)?) {
        var postString = ""
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
            postString = String(bytes: jsonData, encoding: .utf8)!
        } catch {
            // jsonコンバートエラー
            completion!(false, nil)
        }
        
        var request = URLRequest(url: URL(string: BASE_URL + APP + url)!)
        request.httpMethod = POST
        request.httpBody = postString.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            (data, response, error) in
            
            if let data = data, let response = response {
                print(response)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    let data = json[DATA] as Any
                    completion!(true, data)
                } catch {
                    // jsonパースエラー
                    completion!(false, nil)
                }
            } else {
                // null(nil)エラー
                completion!(false, nil)
            }
        })
        task.resume()
    }
}

