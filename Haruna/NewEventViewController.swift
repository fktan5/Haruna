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

protocol OnSaveEventDelegate {
    func saved()
}

class NewEventViewController : FormViewController {

    @IBOutlet weak var CancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    var event:Event = Event()

    var id:String = ""

    var savedDelegate: OnSaveEventDelegate?

    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        if(!id.isEmpty){
            print("id:", id)
            event = realm.object(ofType: Event.self, forPrimaryKey: id)!
            print("Event obj:", event.name)
        } else {
            print("id is Empty (new Item")
        }

        form +++ Section("Event Info")
            <<< TextRow() {
                $0.title = "Event Name"
                $0.placeholder = "Input"
                $0.value = event.name.isEmpty ? "" : event.name
            }.onChange({ (row) in
                try! self.realm.write {
                    self.event.name = row.value == nil ? "" : row.value!
                }
            })

            <<< DateRow() {
                $0.value = event.datetime as Date
                $0.title = "Date"
            }.onChange({(row) in
                try! self.realm.write {
                    self.event.datetime = row.value! as NSDate
                }
            })

            <<< ActionSheetRow<String>{
                $0.title = "User Type"
                $0.selectorTitle = "Select User Type"
                $0.baseValue = event.user.isEmpty ? "Man" : event.user
                $0.options = ["Man", "Female"]
            }.onChange({ (row) in
                try! self.realm.write {
                    self.event.user = row.value!
                }
            })

            <<< ActionSheetRow<String> {
                $0.title = "Event Style"
                $0.selectorTitle = "Select Style"
                $0.baseValue = event.type.isEmpty ? "Reception" : event.type
                $0.options = ["Reception", "After Party"]
            }.onChange({ (row) in
                try! self.realm.write {
                    self.event.type = row.value!
                }
            })

        +++ Section("Access")
            <<< TextRow() {
                $0.title = "Place Name"
                $0.placeholder = "Input"
                $0.value = event.placeName.isEmpty ? "" : event.placeName
            }.onChange({ (row) in
                try! self.realm.write {
                    self.event.placeName = row.value == nil ? "" : row.value!
                }
            })

            <<< LocationRow(){
                $0.title = "Place"
                $0.value = id.isEmpty ?
                    CLLocation(latitude: 35.6870358, longitude: 139.7012083)
                    : CLLocation(latitude: event.locationLat, longitude: event.locationLng)
            }.onChange({ (row) in
                try! self.realm.write {
                    self.event.locationLat = (row.value?.coordinate.latitude)!
                    self.event.locationLng = (row.value?.coordinate.longitude)!
                }
            })

        +++ Section("CheckList")

        +++ Section("Memo")
            <<< TextAreaRow() {
                $0.title = "Memo"
                $0.placeholder = "Input text here"
                $0.value = event.memo.isEmpty ? "" : event.memo
            }.onChange({row in
                try! self.realm.write {
                    self.event.memo = row.value == nil ? "" : row.value!
                }
            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func touchedCancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }

    @IBAction func touchedSaveButton(_ sender : UIBarButtonItem){
        try! realm.write {
            realm.add(event)
        }
        print("new Item id", event.id)
        savedDelegate?.saved()
        self.dismiss(animated: true)
    }
}
