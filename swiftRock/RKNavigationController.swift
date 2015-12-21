//
//  RKNavigationController.swift
//  swiftRock
//
//  Created by Rock on 15/12/8.
//  Copyright © 2015年 Rock. All rights reserved.
//

import UIKit

class RKNavigationController: UINavigationController {
    
    var canDragBack: Bool = false
    var isMoving: Bool = false
    var screenShotsList: NSMutableArray?
    var startTouch: CGPoint = CGPointZero
    var backgroundView: UIView?
    var blackMask: UIView?
    var lastScreenShotView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenShotsList = NSMutableArray.init(capacity: 2)
        canDragBack = true
        
        let recognizer = UIPanGestureRecognizer.init(target: self, action: Selector("paningGestureReceive"))
        self.view.addGestureRecognizer(recognizer)

        // Do any additional setup after loading the view.
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        screenShotsList!.addObject(self.capture())
        super.pushViewController(viewController, animated: animated)
    }
    
    func capture() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, self.view.opaque, 0.0)
        self.view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func paningGestureReceive(recognizer: UIPanGestureRecognizer) {
        if self.viewControllers.count <= 1 {
            return
        }
        let touchPoint: CGPoint = recognizer.locationInView(AppMacro.KEY_WINDOW)
        if recognizer.state == UIGestureRecognizerState.Began {
            isMoving = true
            startTouch = touchPoint
            if backgroundView != nil {
                let frame = self.view.bounds
                backgroundView = UIView.init(frame: frame)
                self.view.superview?.insertSubview(backgroundView!, aboveSubview: self.view)
                blackMask = UIView.init(frame: frame)
                blackMask!.backgroundColor = UIColor.blackColor()
                backgroundView!.addSubview(blackMask!)
            }
            backgroundView?.hidden = false
            if lastScreenShotView != nil {
                lastScreenShotView!.removeFromSuperview()
            }
            let lastScreenShot: UIImage = (screenShotsList!.lastObject as! UIImage)
            lastScreenShotView = UIImageView.init(image: lastScreenShot)
            backgroundView?.insertSubview(lastScreenShotView!, aboveSubview: blackMask!)
        }else if recognizer.state == UIGestureRecognizerState.Ended {
            if touchPoint.x - startTouch.x > 50 {
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.moveViewWithX(375)
                    }, completion: { (finished: Bool) -> Void in
                        self.popViewControllerAnimated(false)
                        var frame = self.view.frame
                        frame.origin.x = 0
                        self.view.frame = frame
                        self.isMoving = false
                })
            }else {
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.moveViewWithX(0)
                    }, completion: { (finished: Bool) -> Void in
                        self.isMoving = false
                        self.backgroundView?.hidden = true
                })
            }
            return
        }else if recognizer.state == UIGestureRecognizerState.Cancelled {
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                self.moveViewWithX(0)
                }, completion: { (finished: Bool) -> Void in
                    self.isMoving = false
                    self.backgroundView?.hidden = true
            })
            return
        }
        if self.isMoving {
            self.moveViewWithX(touchPoint.x - startTouch.x)
        }
    }
    
    func moveViewWithX(var x: CGFloat) {
        if x > 375 {
            x = 375
        }else if x < 0 {
            x = 0
        }
        var frame = self.view.frame
        frame.origin.x = x
        self.view.frame = frame
        let scale = (x/7500) + 0.95
        let alpha = 0.4 - (x/800)
        
        lastScreenShotView?.transform = CGAffineTransformMakeScale(scale, scale)
        blackMask!.alpha = alpha
    }
    
    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {
        screenShotsList!.removeLastObject()
        return super.popViewControllerAnimated(animated)
    }
    
    override func popToViewController(viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        screenShotsList!.removeLastObject()
        return super.popToViewController(viewController, animated: animated)
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
