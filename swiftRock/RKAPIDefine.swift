//
//  RKAPIDefine.swift
//  swiftRock
//
//  Created by Rock on 15/12/4.
//  Copyright © 2015年 Rock. All rights reserved.
//

import Foundation

class RKAPIDefine: AnyObject {
    
    /*****************************设置网络请求API********************************begin*/
    static let API_TODAYTOPIC_DOMAIN_ZHAN = {
        return "http://kpky.api.zhan.com/"
    }
    
    //获取商品列表
    static let API_INTEGRALMALL_GETGOODSLIST =  "\(API_TODAYTOPIC_DOMAIN_ZHAN)goods/getGoodsList"
    
    /*****************************设置网络请求API********************************end*/
}