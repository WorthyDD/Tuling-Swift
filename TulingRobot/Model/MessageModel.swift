//
//  MessageModel.swift
//  TulingRobot
//
//  Created by me on 2018/6/24.
//  Copyright © 2018年 demo. All rights reserved.
//

import UIKit
import SwiftyJSON


class MessageModel: NSObject {
    
    /// 获取答案
    class func getAnswer(input: String, result: @escaping (JSON?) -> ()) {
        let url = "http://openapi.tuling123.com/openapi/api"
        let params: [String: Any] = [
            "key": "8967d7563b6c4dfab39b1a7b04141457",
            "info": "\(input)",
            "loc": "北京市",
            "userid": "123456"
        ]
        
        APIManager.shareInstance.postRequest(urlString: url, params: params) { (json) in
            print("json-----\(json ?? "null")")
            result(json)
        }
    }
}
