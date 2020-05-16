//
//  Team.swift
//  VolleyStats
//
//  Created by Sartaj Singh on 5/6/20.
//  Copyright © 2020 Sartaj Singh. All rights reserved.
//

import Foundation
import RealmSwift

class Team : Object {
    @objc dynamic var name: String?
    let players = List<Player>()
}
