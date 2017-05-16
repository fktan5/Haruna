//
//  NewEventViewController.swift
//  Haruna
//
//  Created by keigo on 2017/05/11.
//  Copyright © 2017年 tan5. All rights reserved.
//

import UIKit
import Eureka

class NewEventViewController : FormViewController {

    @IBOutlet weak var CancelButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        form +++ Section("Event Info")
            <<< TextRow() {
                $0.title = "Event Name"
                $0.placeholder = "Input"
            }

            <<< DateRow() { $0.value = Date(); $0.title = "Date" }


        +++ Section("CheckList")

        +++ Section("Memo")
            <<< TextAreaRow() {
                $0.title = "Memo"
                $0.placeholder = "Input text here"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func touchedCancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
