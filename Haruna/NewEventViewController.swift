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
import RealmSwift

class NewEventViewController : FormViewController {

    @IBOutlet weak var CancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    var event:Event = Event()

    override func viewDidLoad() {
        super.viewDidLoad()

        form +++ Section("Event Info")
            <<< TextRow() {
                $0.title = "Event Name"
                $0.placeholder = "Input"
            }.onChange({ (row) in
                self.event.name = row.value!
            })

            <<< DateRow() {
                $0.value = Date()
                $0.title = "Date"
            }.onChange({(row) in
                self.event.datetime = row.value! as NSDate
            })

            <<< ActionSheetRow<String>{
                $0.title = "User Type"
                $0.selectorTitle = "Select User Type"
                $0.baseValue = "Man"
                $0.options = ["Man", "Female"]
                }.onChange({ (row) in
                    self.event.user = row.value!
                })

            <<< ActionSheetRow<String> {
                $0.title = "Event Style"
                $0.selectorTitle = "Select Style"
                $0.baseValue = "Reception"
                $0.options = ["Reception", "After Party"]
            }.onChange({ (row) in
                self.event.type = row.value!
            })

        +++ Section("Access")
            <<< TextRow() {
                $0.title = "Place Name"
                $0.placeholder = "Input"
            }.onChange({ (row) in
                self.event.placeName = row.value!
            })

            <<< LocationRow(){
                $0.title = "Place"
                $0.value = CLLocation(latitude: 35.6870358, longitude: 139.7012083)
            }.onChange({ (row) in
                self.event.locationLat = (row.value?.coordinate.latitude)!
                self.event.locationLng = (row.value?.coordinate.longitude)!
            })

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
        let realm = try! Realm()
        try! realm.write {
            realm.add(event)
        }

        self.dismiss(animated: true)
    }
}
