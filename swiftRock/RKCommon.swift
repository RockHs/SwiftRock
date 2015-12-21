//
//  RKCommon.swift
//  swiftRock
//
//  Created by Rock on 15/11/19.
//  Copyright © 2015年 Rock. All rights reserved.
//

import Foundation
import UIKit

class RKCommon: AnyObject {

    /*****************************统一调用push切换页面********************************begin*/
    class func pushViewController(vc: UIViewController, animate: Bool) {
        (UIApplication.sharedApplication().windows[0].rootViewController?.navigationController)!.pushViewController(vc, animated: animate)
    }
    class func presentViewController(vc: UIViewController, animate: Bool) {
        (UIApplication.sharedApplication().windows[0].rootViewController?.navigationController)!.presentViewController(vc, animated: animate, completion: nil)
    }
    class func popViewControllerAnimated(animate: Bool) {
        (UIApplication.sharedApplication().windows[0].rootViewController?.navigationController)!.popToRootViewControllerAnimated(animate)
    }
    class func popToViewController(vc: UIViewController, animate: Bool) {
        (UIApplication.sharedApplication().windows[0].rootViewController?.navigationController)!.popToViewController(vc, animated: animate)
    }
    /*****************************统一调用push切换页面********************************end*/
    
}
