//
//  RKConfig.swift
//  swiftRock
//
//  Created by Rock on 15/12/4.
//  Copyright © 2015年 Rock. All rights reserved.
//

import Foundation
import UIKit

class RKConfig: AnyObject {
    /*****************************设置颜色值处理********************************begin*/
    //App主题背景色
    static let RKThemeBackgroudColor = AppMacro.HEX(0xf56374)
    //App按钮灰色背景（禁止点击）
    static let RKGrayButtonColor = AppMacro.HEX(0xc8c7c7)
    //App按钮褐色背景（可点击）
    static let RKBrownButtonColor = AppMacro.HEX(0xf56374)
    //App分隔符统一颜色值
    static let RKSepartorColor = AppMacro.HEX(0xdddddd)
    //App navigationbar标题颜色值
    static let RKThemeTextColor = AppMacro.HEX(0xf56374)
    //App标题字体颜色值
    static let RKBackTextColor = AppMacro.HEX(0x494949)
    //App副标题字体颜色值
    static let RKDetialTitleColor = AppMacro.HEX(0x808080)
    /*****************************设置颜色值处理********************************end*/

    /*****************************设置文字大小处理********************************begin*/
    //App标题字体大小
    static let RKTitleFont = AppMacro.RKFont(16)
    //App副标题字体大小
    static let RKDetailTitleFont = AppMacro.RKFont(14)
    /*****************************设置文字大小处理********************************end*/

    /*****************************自定义UI高度、宽度********************************begin*/
    //分隔符高度
    static let RKSepartorHeight = CGFloat(0.5)
    /*****************************自定义UI高度、宽度********************************end*/
    
}