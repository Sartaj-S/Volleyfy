//
//  Player.swift
//  VolleyStats
//
//  Created by Sartaj Singh on 5/6/20.
//  Copyright © 2020 Sartaj Singh. All rights reserved.
//

import Foundation
import RealmSwift

class Player : Object {
    @objc dynamic var name: String? = ""
    @objc dynamic var number: String? = ""
    //@objc dynamic var image: image
    
    
    @objc dynamic var kills = 0
    @objc dynamic var attackErrors = 0
    
    @objc dynamic var digs = 0
    @objc dynamic var digError = 0
    
    @objc dynamic var serviceAttempts = 0
    @objc dynamic var aces = 0
    @objc dynamic var serviceErrors = 0
    
    @objc dynamic var serverec = 0
    @objc dynamic var serverecErr = 0
}
