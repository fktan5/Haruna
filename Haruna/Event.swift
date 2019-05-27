//
//  Event.swift
//  Haruna
//
//  Created by keigo on 2017/05/03.
//  Copyright © 2017年 tan5. All rights reserved.
//

import Foundation
import RealmSwift

class Event: Object {
    @objc dynamic var id:String = UUID().uuidString
    @objc dynamic var name:String = ""
    @objc dynamic var user:String = ""
    @objc dynamic var type:String = ""
    @objc dynamic var placeName:String = ""
    @objc dynamic var locationLat:Double = 0.0
    @objc dynamic var locationLng:Double = 0.0
    @objc dynamic var datetime:NSDate = NSDate()
    @objc dynamic var memo:String = ""

    let checklist = List<CheckItem>()

    override static func primaryKey() -> String? {
        return "id"
    }
}

class CheckItem:Object {
    @objc dynamic var id:String = UUID().uuidString
    @objc dynamic var name:String = ""
    @objc dynamic var isGet:Bool = false

    let event = LinkingObjects(fromType: Event.self, property: "checklist")
}
