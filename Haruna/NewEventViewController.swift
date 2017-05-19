//
//  NewEventViewController.swift
//  Haruna
//
//  Created by keigo on 2017/05/11.
//  Copyright © 2017年 tan5. All rights reserved.
//

import UIKit
import Eureka
import CoreLocation

class NewEventViewController : FormViewController {

    @IBOutlet weak var CancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        form +++ Section("Event Info")
            <<< TextRow() {
                $0.title = "Event Name"
                $0.placeholder = "Input"
            }

            <<< DateRow() {
                $0.value = Date()
                $0.title = "Date" }

            <<< ActionSheetRow<String> {
                $0.title = "Event Style"
                $0.selectorTitle = "Select Style"
                $0.options = ["Reception", "After Party"]
            }

        +++ Section("Access")
            <<< TextRow() {
                $0.title = "Place Name"
                $0.placeholder = "Input"
            }
            
            <<< LocationRow(){
                $0.title = "Place"
                $0.value = CLLocation(latitude: 35.6870358, longitude: 139.7012083)
            }

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

    @IBAction func touchedSaveButton(_ sender : UIBarButtonItem){
        NSLog("Save");
    }
}
