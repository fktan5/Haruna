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
    dynamic var id:String = UUID().uuidString
    dynamic var name:String = ""
    dynamic var user:String = ""
    dynamic var type:String = ""
    dynamic var placeName:String = ""
    dynamic var locationLat:Double = 0.0
    dynamic var locationLng:Double = 0.0
    dynamic var datetime:NSDate = NSDate()
    dynamic var memo:String = ""

    let checklist = List<CheckItem>()

    override static func primaryKey() -> String? {
        return "id"
    }
}

class CheckItem:Object {
    dynamic var id:String = UUID().uuidString
    dynamic var name:String = ""
    dynamic var isGet:Bool = false

    let event = LinkingObjects(fromType: Event.self, property: "checklist")
}
