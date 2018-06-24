//
//  APIManager.swift
//  Summer
//
//  Created by 武淅 段 on 2017/8/7.
//  Copyright © 2017年 wuxi. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class APIManager: NSObject {
    
    
    static let shareInstance:APIManager = APIManager()
    
    let baseUrl:String = "http://xhfmedia.com"
    var headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    
    
    override init() {
        super.init()
    }
    
    //MARK: - request
    
    func postRequest(urlString: String, params: [String: Any]?, result: @escaping(_ resultObject: JSON?) -> ()) {
        
        var url = urlString
        if !urlString.hasPrefix("http") {
            url = baseUrl+urlString
        }
//        do {
//            let data = try JSONSerialization.data(withJSONObject: params!, options: .prettyPrinted)
//            var request = URLRequest(url: URL(string: url)!)
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.httpMethod = "POST"
//            request.httpBody = data
            
            Alamofire.request(url, method: HTTPMethod.post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (response) in
                if let value = response.result.value {
                    
                    let resultDic = JSON(value)
                    result(resultDic)
                }
                else {
                    result(nil)
                }
            })
//        }
//        catch {
//            
//        }
    }
    
    
}
