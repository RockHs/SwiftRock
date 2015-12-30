//
//  ViewController.swift
//  swiftRock
//
//  Created by Rock on 15/11/19.
//  Copyright © 2015年 Rock. All rights reserved.
//

import UIKit
import SCLAlertView

class ViewController: RKBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView : UITableView?
    var scrollView : UIScrollView?
    var beikaoTextArr : NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = RKConfig.RKThemeBackgroudColor
        
        self.beikaoTextArr = ["口语练习", "跟读训练", "口语模考", "考位预订"]
        
        
        self.beikaoScrollView();
        
        let tableView = UITableView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height), style: UITableViewStyle.Plain);
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "identifier");
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clearColor()
        
//        let rk = RKCommon();
//        rk.pushViewController(UIViewController, animate: <#T##Bool#>)
        self.view.addSubview(tableView);
        
//        SCLAlertView().showInfo("Important info", subTitle: "You are great")
        
//        SCLAlertView().showInfo("题目", subTitle: "加载成功罗，亲们😄👌")
        
        
        
    }
    
    //我要备考
    func beikaoScrollView() -> UIScrollView {
        let image = UIImage(named: "homepage_beikao_0")
        let scrollView = UIScrollView(frame: CGRectMake(0, 0, self.view.frame.width, (image?.size.height)! + 56))
        scrollView.backgroundColor = UIColor.clearColor()
        
//        //按钮之间间隙
//        CGFloat sepator = (SCREEN_WIDTH - image.size.width*showViewNum)/(showViewNum + 1);
//        for (NSInteger i = 0; i < showViewNum; i++) {
//            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
//            button.backgroundColor = [UIColor clearColor];
//            button.tag = i;
//            button.frame = CGRectMake(sepator + (image.size.width+sepator)*i, 10, image.size.width, image.size.height);
//            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"homepage_beikao_%ld"
//                ,(long)i]] forState:UIControlStateNormal];
//            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"homepage_beikao_selected_%ld"
//                ,(long)i]] forState:UIControlStateHighlighted];
//            [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//                if ([self.viewModel.beikaoArr[button.tag] isEqualToString:@"XZExamPlaceViewController"]) {
//                XZCheckAndShowLoginScreen
//                }
//                [XZCommon pushWithVCClass:self.viewModel.beikaoArr[button.tag] properties:nil];
//                }];
//            [self.beikaoScrollView addSubview:button];
//        }
        let sepator : CGFloat = (self.view.frame.width - (image?.size.width)! * 4)/5
        
        let gifImage = UIImage.gifWithName("jeremy")

        
        for(var i = 0; i < 4; i++){
            let buttom = UIButton(type: UIButtonType.Custom);
            buttom.frame = CGRectMake(sepator + ((image?.size.width)! + sepator) * CGFloat(i), 10, (image?.size.width)!, (image?.size.height)!);
            buttom.setImage(gifImage, forState: UIControlState.Normal);
            buttom.addTarget(self, action: Selector("pushToVC:"), forControlEvents: .TouchUpInside);
            buttom.rkMakeRoundCorner()
            
            scrollView.addSubview(buttom);
            
            let lab = UILabel(frame: CGRectMake(buttom.frame.origin.x, buttom.frame.origin.y + buttom.frame.size.height + 8, buttom.frame.size.width, 20))
            lab.textAlignment = NSTextAlignment.Center;
            lab.text = self.beikaoTextArr![i] as? String
            scrollView.addSubview(lab);
            
        }
        scrollView.contentSize = CGSizeMake(self.view.rkWidth, (image?.size.height)!+56);
        self.scrollView = scrollView;
        return scrollView;
    }
    
    func pushToVC(button: UIButton) {
        
//        SCLAlertView().showInfo("Important info", subTitle: "You are great")
        
        let alertViewResponder: SCLAlertViewResponder = SCLAlertView().showSuccess("Hello World", subTitle: "This is a more descriptive text.")
        
        // Upon displaying, change/close view
        alertViewResponder.setTitle("New Title") // Rename title
        alertViewResponder.setSubTitle("New description") // Rename subtitle
//        alertViewResponder.close()

//        self.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return (self.scrollView?.frame.height)!;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "identifier");
//        cell.textLabel?.text = "row\(indexPath.row)";
        cell.addSubview(self.scrollView!);
        return cell;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

