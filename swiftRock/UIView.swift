//
//  UIView.swift
//  swiftRock
//
//  Created by Rock on 15/11/20.
//  Copyright © 2015年 Rock. All rights reserved.
//

import Foundation
import UIKit


var viewClickKey: NSString?

extension UIView {
        
    typealias UIViewClickHandler = (view: UIView) -> Void
//    var viewClickHandler: UIViewClickHandler

    /****************************设置View顶部y坐标*********************************/
    var rkTop: CGFloat {
        return self.frame.origin.y
    }
    /******************************设置View左边x坐标*******************************/
    var rkLeft: CGFloat {
        return self.frame.origin.x
    }
    /****************************设置View底部y坐标*************************************/
    var rkBottom: CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    /****************************设置View右边x坐标*********************************/
    var rkRight: CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    /**************************设置View的宽度***********************************/
    var rkWidth: CGFloat {
        return self.frame.size.width;
    }
    /*****************************设置View的高度********************************/
    var rkHeight: CGFloat {
        return self.frame.size.height;
    }
    /*****************************设置View的中心坐标********************************/
    var rkCenterX: CGFloat {
        return self.center.x;
    }
    var rkCenterY: CGFloat {
        return self.center.y;
    }
    
    /*****************************设置View的layer边框角度********************************/
    func rkMakeRoundCorner() {
        self.rkMakeRoundCornerWithRadius(min(self.rkWidth, self.rkHeight)/2)
    }
    
    func rkMakeRoundCornerWithRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.rasterizationScale = UIScreen.mainScreen().scale
        self.layer.shouldRasterize = true
        self.layer.masksToBounds = true
    }
    
    /*****************************设置View的单击事件监控********************************/
    func handleClick(handler: UIViewClickHandler!) {
        self.userInteractionEnabled = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("viewClick"))
        self.addGestureRecognizer(tap)
        if handler != nil {
//            objc_setAssociatedObject(self, &viewClickKey, handler as UIViewClickHandler, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    func viewClick() {
//        let callBack: UIViewClickHandler = objc_getAssociatedObject(self, &viewClickKey)
//        callBack(view: self)
    }
}