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
    dynamic var name:String = ""
    dynamic var user:String = ""
    dynamic var type:String = ""
    dynamic var placeName:String = ""
    dynamic var locationLat:Double = 0.0
    dynamic var locationLng:Double = 0.0
    dynamic var datetime:NSDate = NSDate()
//    dynamic var checklist:List = List<CheckItem>()
    dynamic var memo:String = ""
}

class CheckItem:Object {
    dynamic var name:String = ""
}
