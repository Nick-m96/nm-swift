//
//  Cell.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 08/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Argo
import Curry
import Runes

public struct Book {
    
    let id: Int
    let author: String
    let title: String
    let genre: String
    let publisher: String
    let year: String
//    let imageUrl : String
//    let description: String
}

extension Book: Argo.Decodable {
    
    public static func decode(_ json: JSON) -> Decoded<Book> {
        return curry(Book.init)
            <^> json <| "id"
            <*> json <| "author"
            <*> json <| "title"
            <*> json <| "genre"
            <*> json <| "publisher"
            <*> json <| "year"
//            <*> json <| "imageUrl"
//            <*> json <| "description"
    }
    
    
    
}
