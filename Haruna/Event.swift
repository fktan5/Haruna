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
    var user:String = ""
    var type:Bool = true
    var access:String = ""
//    var location:
    var datetime:NSDate = NSDate()
    var checklist:List = List<CheckItem>()
    var memo:String = ""
    
    class CheckItem:Object {
        var name:String = ""        
    }
}
