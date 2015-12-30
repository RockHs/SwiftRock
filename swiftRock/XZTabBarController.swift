//
//  XZTabBarController.swift
//  kykpSwift
//
//  Created by Rock on 15/11/19.
//  Copyright © 2015年 Rock. All rights reserved.
//

import UIKit


class XZTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let homeViewController = ViewController();
        
        let homeImage = UIImage(named: "homeicon");
        let homeImageSelected = UIImage(named: "homeicon_select");
        
        let homeItem = UITabBarItem(title: nil, image: homeImage, selectedImage: homeImageSelected);
        homeViewController.tabBarItem = homeItem;
        
        self.viewControllers = [homeViewController];
        
        
        
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
