//
//  RKBaseViewController.swift
//  swiftRock
//
//  Created by Rock on 15/12/4.
//  Copyright © 2015年 Rock. All rights reserved.
//

import UIKit

class RKBaseViewController: UIViewController {
    
    //顶栏View
    var headerView: UIView?
    //顶栏的标题
    var headerTitle: UILabel?
    //左边按钮
    var leftItemBt: UIButton?
    //右边按钮
    var rightItemBt: UIButton?
    var height: CGFloat = 0.0
    var titleFont: UIFont?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //通用VC底色
        self.view.backgroundColor = AppMacro.HEX(0xeeeeee)
        //隐藏默认顶栏
        self.navigationController?.navigationBarHidden = true
        
        var top: CGFloat
        if AppMacro.IS_IPHONE4_OR_LESS {
            self.height = 54
            top = 10
            self.titleFont = AppMacro.RKFont(16)
        }else{
            self.height = 64
            top = 20
            self.titleFont = AppMacro.RKFont(18)
        }
        
        let headerView = UIView(frame: CGRectMake(0, 0, AppMacro.SCREEN_WIDTH, self.height))
        headerView.backgroundColor = RKConfig.RKThemeBackgroudColor
        self.view.addSubview(headerView)
        self.headerView = headerView
        
        //创建标题
        let headerTitle = UILabel(frame: CGRectMake(44, self.headerView!.rkHeight - 44, self.headerView!.rkWidth - 88, 44))
        headerTitle.backgroundColor = UIColor.clearColor()
        headerTitle.font = self.titleFont
        headerTitle.textAlignment = NSTextAlignment.Center
        headerTitle.textColor = RKConfig.RKThemeTextColor
        self.headerView!.addSubview(headerTitle)
        self.headerTitle = headerTitle
        //左边button是默认创建的
        let leftItemBt = UIButton(type: UIButtonType.Custom)
        leftItemBt.frame = CGRectMake(5, top, 44, 44)
        leftItemBt.backgroundColor = UIColor.clearColor()
        leftItemBt.setImage(UIImage(named: "nav_back"), forState: UIControlState.Normal)
        leftItemBt.addTarget(self, action: Selector("leftItemBtAction"), forControlEvents: .TouchUpInside)
        self.headerView!.addSubview(leftItemBt)
        self.leftItemBt = leftItemBt
        
        let separtorLab = UILabel(frame: CGRectMake(0, self.height - RKConfig.RKSepartorHeight, AppMacro.SCREEN_WIDTH, RKConfig.RKSepartorHeight))
        separtorLab.backgroundColor = RKConfig.RKSepartorColor
        self.headerView!.addSubview(separtorLab)
        
    }
    
    //初始化headerView
//    func headerView() -> UIView {
////        if _headerView != nil {
////            
////        }
//        return headerView
//    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
