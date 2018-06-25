//
//  NewsModel.swift
//  TulingRobot
//
//  Created by wuxi on 2018/6/24.
//  Copyright © 2018年 demo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import HandyJSON

let appKey = "23942860"
let appSK = "2d087550f1296820ca9c6005ab9b6ac0"
let appCode = "2840f55e174d49d78f65fdb866a26894"

class NewsModel: NSObject, HandyJSON {

    required override init() {
        
    }
    
    var title = ""
    var date = ""
    var author_name = ""
    var thumbnail_pic_s = ""
    var thumbnail_pic_s02 = ""
    var thumbnail_pic_s03 = ""
    var url = ""
    var uniquekey = ""
    var type = ""
    var realtype = ""
    
    class func getNewsModel(result: @escaping ([NewsModel]?) -> ()) {
        let url = "http://toutiao-ali.juheapi.com/toutiao/index"
        let header: HTTPHeaders = ["Authorization": "APPCODE \(appCode)"]
        Alamofire.request(url, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: header).responseJSON(completionHandler: { (response) in
            if let value = response.result.value {
                
                let data = [NewsModel].deserialize(from: JSON(value)["result"]["data"].rawString()) as! [NewsModel]
                result(data)
            }
            else {
                result(nil)
            }
        })
    }
    
}
