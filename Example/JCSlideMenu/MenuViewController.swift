//
//  MenuViewController.swift
//  JCSlideMenu_Example
//
//  Created by Jack Colley on 22/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import JCSlideMenu

class MenuViewController: BaseMenu {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func homeButtonPressed(sender: UIButton) {
        self.onCloseMenuClick(controller: self.storyboard!.instantiateInitialViewController()!)
    }

    @IBAction func aboutButtonPressed(sender: UIButton) {
        let aboutController = self.storyboard?.instantiateViewController(withIdentifier: "aboutNavController")

        self.onCloseMenuClick(controller: aboutController!)
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
