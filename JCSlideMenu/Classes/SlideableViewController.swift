//
//  SlideableViewController.swift
//  JCSlideMenu
//
//  Created by Jack Colley on 22/02/2018.
//

import Foundation
import UIKit

open class SlideableViewController: UIViewController, SlideMenuDelegate {

    open func slideMenuTransitionToController(controller: UIViewController) {
        let topViewController: UIViewController = self.navigationController!.topViewController!

        if(topViewController.restorationIdentifier == controller.restorationIdentifier) {
            self.navigationItem.leftBarButtonItem?.tag = 0
        } else {
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromRight
            transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
            view.window!.layer.add(transition, forKey: kCATransition)
            self.navigationController?.present(controller, animated: false)
        }
    }

    open func addSlideMenuButton(){
        let btnShowMenu = UIButton(type: UIButtonType.system)
        btnShowMenu.setImage(self.defaultMenuImage(), for: UIControlState())
        btnShowMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnShowMenu.addTarget(self, action: #selector(self.onSlideMenuButtonPressed(_:)), for: UIControlEvents.touchUpInside)
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        self.navigationItem.leftBarButtonItem = customBarItem;
    }

    func defaultMenuImage() -> UIImage {
        var defaultMenuImage = UIImage()

        UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 22), false, 0.0)

        UIColor.black.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 3, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 10, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 17, width: 30, height: 1)).fill()

        UIColor.white.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 4, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 11,  width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 18, width: 30, height: 1)).fill()

        defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext()!

        UIGraphicsEndImageContext()

        return defaultMenuImage;
    }

    @objc open func onSlideMenuButtonPressed(_ sender : UIButton){
        if (sender.tag == 10)
        {
            let viewMenuBack : UIView = view.subviews.last!
            let childVC = self.childViewControllers.last as? BaseMenu

            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                if let childVC = childVC {
                    childVC.willMove(toParentViewController: nil)
                    childVC.removeFromParentViewController()
                }

                viewMenuBack.removeFromSuperview()
                sender.tag = 0
            })

            return
        }

        sender.isEnabled = false
        sender.tag = 10

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menuVC: BaseMenu = storyboard.instantiateViewController(withIdentifier: "leftMenuVC") as! BaseMenu

        menuVC.delegate = self

        UIApplication.shared.delegate!.window!?.addSubview(menuVC.view)

        self.addChildViewController(menuVC)
        menuVC.view.layoutIfNeeded()


        menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width - 100, y: 0, width: UIScreen.main.bounds.size.width - 100, height: UIScreen.main.bounds.size.height);

        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 100, height: UIScreen.main.bounds.size.height);
            sender.isEnabled = true
        }, completion:nil)
    }
}

