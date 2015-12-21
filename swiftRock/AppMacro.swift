//
//  AppMacro.swift
//  swiftRock
//
//  Created by Rock on 15/11/19.
//  Copyright © 2015年 Rock. All rights reserved.
//

import Foundation
import UIKit

class AppMacro: AnyObject {
    /*****************************设置VC尺寸及系统处理********************************begin*/
    //系统版本号
    static let XCODEAPPVERSION = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"]
    static let KEY_WINDOW = UIApplication.sharedApplication().keyWindow
     //判断为iPhone设备
    static let IS_PHONE = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone
    //判断为ipad设备
    static let IS_IPAD = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad
    //判断为retina屏
    static let IS_RETINA = UIScreen.mainScreen().scale >= 2.0
    //设备宽度
    static let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    //设备高度
    static let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    //判断为iphone5及以下设备
    static let IS_IPHONE5_OR_LESS = IS_PHONE && SCREEN_HEIGHT <= 568.0
    //判断为iphone4及以下设备
    static let IS_IPHONE4_OR_LESS = IS_PHONE && SCREEN_HEIGHT < 568.0
    //判断为iPhone6设备
    static let IS_IPHONE6 = IS_PHONE && SCREEN_HEIGHT == 667.0
    //判断为iPhone+设备
    static let IS_IPHONE6P = IS_PHONE && SCREEN_HEIGHT == 736.0
//    //ios系统
//    class func IS_IOS7() -> Bool {
//        let version = UIDevice.currentDevice().systemVersion
//        switch version.compare("7.0.0", options: NSStringCompareOptions.NumericSearch){
//        case .OrderedSame, .OrderedDescending:
//            return true
//        case .OrderedAscending:
//            return false
//        }
//    }
    /*****************************设置VC尺寸及系统处理********************************end*/
    
    /*****************************设置数据校验处理********************************begin*/
    class func NSStringSafety(obj: AnyObject) -> NSString {
        if obj.isKindOfClass(NSString) {
            return obj as! NSString
        }else {
            return ""
        }
    }
    class func NSArraySafety(obj: AnyObject) -> NSArray? {
        if obj.isKindOfClass(NSArray) {
            return obj as? NSArray
        }else {
            return nil
        }
    }
    class func NSDictionarySafety(obj: AnyObject) -> NSDictionary? {
        if obj.isKindOfClass(NSDictionary) {
            return obj as? NSDictionary
        }else {
            return nil
        }
    }
    class func NSMutableArraySafety(obj: AnyObject) -> NSMutableArray? {
        if obj.isKindOfClass(NSMutableArray) {
            return obj as? NSMutableArray
        }else {
            return nil
        }
    }
    class func NSMutableDictionarySafety(obj: AnyObject) -> NSMutableDictionary? {
        if obj.isKindOfClass(NSMutableDictionary) {
            return obj as? NSMutableDictionary
        }else {
            return nil
        }
    }
    class func ObjectForKeySafety(obj: AnyObject, key: NSString) -> AnyObject {
        if obj.isKindOfClass(NSDictionary) {
            return obj.objectForKey(key)!
        }else {
            return ""
        }
    }
    class func ObjectForKeySafety(obj: AnyObject, index: NSInteger) -> AnyObject {
        if obj.isKindOfClass(NSArray) && index < obj.count {
            return obj.objectAtIndex(index)
        }else {
            return ""
        }
    }
    /*****************************设置数据校验处理********************************end*/
    
    /*****************************设置颜色值处理********************************begin*/
    class func RGB(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
        return RGBA(r, g: g, b: b, a: 1)
    }
    class func RGBA(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    class func HEX(rgbValue: NSInteger) -> UIColor {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgbValue & 0xFF))/255.0, alpha: 1.0)
    }
    /*****************************设置颜色值处理********************************end*/
     
    /*****************************设置文字大小处理********************************begin*/
    class func RKFont(fontSize: CGFloat) -> UIFont {
        return UIFont.systemFontOfSize(fontSize)
    }
    /*****************************设置文字大小处理********************************end*/

}


