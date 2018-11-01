//
//  UserComent.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 01/11/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Argo
import Curry
import Runes

struct UserComment {
    let user : User
    let comment : String
}

extension UserComment: Argo.Decodable {
    
    static func decode(_ json: JSON) -> Decoded<UserComent> {
        return curry(UserComent.init)
            <^> json <| "user"
            <*> json <| "comment"
    }
}
