//
//  BaseMenu.swift
//  JCSlideMenu
//
//  Created by Jack Colley on 22/02/2018.
//

import UIKit

open class BaseMenu: UIViewController {

    /**
     *  Delegate of the MenuVC
     */
    var delegate : SlideMenuDelegate?
    
    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    open func onCloseMenuClick(controller: UIViewController) {
        if (self.delegate != nil) {
            delegate?.slideMenuTransitionToController(controller: controller)
        }

        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
