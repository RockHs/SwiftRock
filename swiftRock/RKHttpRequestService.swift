//
//  RKHttpRequestService.swift
//  swiftRock
//
//  Created by Rock on 15/12/8.
//  Copyright © 2015年 Rock. All rights reserved.
//

import UIKit
import Alamofire

class RKHttpRequestService: NSObject {
    //请求header
    let headers = ["platform": "IOS", "version": AppMacro.XCODEAPPVERSION]
    //get请求
    class func getUrl(url: String, params: NSDictionary, completed:(() -> Void)) {
        Alamofire.request(.GET, url, parameters: params as? [String : AnyObject]).responseData { response in
            completed()
            
        }
    }
    //下载
    class func download() {
//        properties and methods
    }
}
