//
//  AboutViewController.swift
//  JCSlideMenu_Example
//
//  Created by Jack Colley on 22/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import JCSlideMenu

class AboutViewController: SlideableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func menuButtonPressed(sender: UIButton) {
        self.onSlideMenuButtonPressed(sender)
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
