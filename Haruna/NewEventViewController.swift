//
//  NewEventViewController.swift
//  Haruna
//
//  Created by keigo on 2017/05/11.
//  Copyright © 2017年 tan5. All rights reserved.
//

import UIKit

class NewEventViewController : UIViewController {

    @IBOutlet weak var CancelButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func touchedCancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
