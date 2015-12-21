//
//  NSObject.swift
//  swiftRock
//
//  Created by Rock on 15/11/20.
//  Copyright © 2015年 Rock. All rights reserved.
//

import Foundation

//let Prefix = "T@"
//let Prefix1 = ","
//let temp = "."
//var CoustomPrefix:String?
//var Cla :AnyClass?

extension NSObject {
    
    /**
    *  通过NSDictionary初始化property
    *  为什么要增加这个，目的是避免服务器数据类型错误的问题
    *  @param item
    */
    
    func initializeWithDictionary(item: NSDictionary) {
        if !item.isKindOfClass(NSDictionary.classForCoder()) {
            return
        }
        //获取所有property
        self.setClassProperty(self.classForCoder, withPropertyDic: item)
        if ((self.superclass) != nil) {
            self.setClassProperty(self.superclass!, withPropertyDic: item)
        }
    }
    
    func setClassProperty(rkclass: AnyClass, withPropertyDic item: NSDictionary) {
        var outCount: UInt32 = 0
        let properties = class_copyPropertyList(rkclass, &outCount)
        for var i = 0; i < Int(outCount); i++ {
            let property: objc_property_t = properties[i]
            //property名称
            let propertyName: NSString = NSString(CString: property_getName(property), encoding: NSUTF8StringEncoding)!
            let valueItem: AnyObject? = item[propertyName]
            if valueItem != nil {
                //获取该property的数据类型
                let attrString: NSString = NSString(CString: property_getAttributes(property), encoding: NSUTF8StringEncoding)!
                self.setPropery(attrString, attriValue:valueItem!, attriPropertyName: propertyName)

            }
        }
        free(properties);
    }
    
    func setPropery(attriString: NSString, attriValue value: AnyObject, attriPropertyName propertyName: NSString) {
//        CoustomPrefix = (attriString as NSString).substringFromIndex(Prefix.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
//        if !CoustomPrefix!.hasPrefix(Prefix1){
//            var CustomValueName:String? = CoustomPrefix!.componentsSeparatedByString(Prefix1).first!
            
//            if value.isKindOfClass(NSDictionary.classForCoder()) {
//                // 根据类型字符串创建类
//                Cla = self.swiftClassFromString(CustomValueName!)
//                if Cla != nil {
//                    //  将转换后的类作为Value
//                    var CustomValueObject: AnyObject = Cla!.objectWithKeyValues(value as! NSDictionary)
//                    objc.setValue(CustomValueObject, forKey: keys as String)
//                    
//                }
//                
//                self.setValue(AppMacro.NSDictionarySafety(value), forKey: propertyName)
//            }
        if attriString.hasPrefix("T@\"NSMutableArray\"") {
            self.setValue(AppMacro.NSMutableArraySafety((value as? NSMutableArray)!), forKey: propertyName as String)
        }else if attriString.hasPrefix("T@\"NSArray\"") {
            self.setValue(AppMacro.NSArraySafety((value as? NSArray)!), forKey: propertyName as String)
        }else if attriString.hasPrefix("T@\"NSMutableDictionary\"") {
            self.setValue(AppMacro.NSMutableDictionarySafety((value as? NSMutableDictionary)!), forKey: propertyName as String)
        }else if attriString.hasPrefix("T@\"NSDictionary\"") {
            self.setValue(AppMacro.NSDictionarySafety((value as? NSDictionary)!), forKey: propertyName as String)
        }else if attriString.hasPrefix("T@\"NSString\"") {
            self.setValue(AppMacro.NSStringSafety((value as? NSString)!), forKey: propertyName as String)
        }else if attriString.hasPrefix("T@\"NSDate\"") {
            self.setValue((value as? NSDate)!, forKey: propertyName as String)
        }else if attriString.hasPrefix("T@\"NSNumber\"") {
            self.setValue((value as? NSNumber)!, forKey: propertyName as String)
        }else if attriString.hasPrefix("T@\"NSIndexPath\"") {
            self.setValue((value as? NSIndexPath)!, forKey: propertyName as String)
        }
    }
    
//    func swiftClassFromString(className: String) -> AnyClass! {
//        if  let appName: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String? {
//            let typeStr = "\""
//            if className.hasPrefix(typeStr){
//                // "\"User1\""
//                var rang = (className as NSString).substringFromIndex(typeStr.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
//                // 类型字符串截取
//                let length = rang.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
//                // User1\""
//                rang = (rang as NSString).substringToIndex(length.hashValue-1)
//                return NSClassFromString("\(appName).\(rang)")
//            }
//        }
//        return nil;
//    }
    
//    class func swiftClassFromString(className: String) -> AnyClass! {
//        //方法 NSClassFromString 在Swift中已经不起作用了no effect，需要适当更改
//        if  var appName: String? = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String? {
//            // generate the full name of your class (take a look into your "appname-swift.h" file)
//            //            let classStringName = "_TtC\(appName!.utf16Count)\(appName!)\(count(className))\(className)"//xcode 6.1-6.2 beta
//            let classStringName = "_TtC\(count(appName!))\(appName!)\(count(className))\(className)"
//            var  cls: AnyClass? = NSClassFromString(classStringName)
//            //  method2
//            //cls = NSClassFromString("\(appName!).\(className)")
//            assert(cls != nil, "class not found,please check className")
//            return cls
//            
//        }
//        return nil;
//    }
    
    //获取对象的所有属性名和属性值
    func allPropertyNamesAndValues() -> [String: AnyObject] {
        var outCount: UInt32 = 0
        let properties = class_copyPropertyList(self.classForCoder, &outCount)
        var resultDic: [String: AnyObject] = [:]
        for var i = 0; i < Int(outCount); i++ {
            let property = properties[i]
            //获取属性名称
            let name = property_getName(property)
            if let  propertyName = String.fromCString(name) {
                if let propertyValue = self.valueForKey(propertyName) {
                    resultDic[propertyName] = propertyValue
                }
            }
        }
        return resultDic
    }
    
    //获取对象的所有方法名
    func allMethods() {
        var outCount: UInt32 = 0
        let methods = class_copyMethodList(self.classForCoder, &outCount)
        for var i = 0; i < Int(outCount); i++ {
            let method = methods[i]
            let name = method_getName(method)
            let methodName = sel_getName(name)
            let argument = method_getNumberOfArguments(method)
            print("name: \(methodName), argument: \(argument)")
        }
    }
    
    /**
    *  重置所有property
    */
    func resetAllProperty() {
        var outCount: UInt32 = 0
        let properties = class_copyPropertyList(self.classForCoder, &outCount)
        for var i = 0; i < Int(outCount); i++ {
            let property = properties[i]
            //获取属性名称
            let name = property_getName(property)
            if let propertyName = String.fromCString(name) {
                let attries = property_getAttributes(property)
                //获取该property的数据类型
                if let attrString = String.fromCString(attries) {
                    if attrString.hasPrefix("T@") {
                        self.setValue(nil, forKey: propertyName)
                    }
                }
            }
        }
    }
}
