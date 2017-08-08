//
//  LevelMenu.swift
//  Syllabus Prep
//
//  Created by Matthew Balleza on 7/24/17.
//  Copyright © 2017 Matthew Balleza. All rights reserved.
//  This software is released under the "Apache 2.0 License".
//  Please see the file LICENSE in the source distribution of
//  this software for license terms.

import UIKit

class LevelMenu: UIViewController {
    var level = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Level " + String(level)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueEarTraining" {
            let earTrainingController = segue.destination as! EarTrainingView
            earTrainingController.viewTitle = "Ear Training"
            earTrainingController.level = self.level
        }
    }

}
