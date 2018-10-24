//
//  BookInfoDetailCell.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 22/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import WolmoCore
import Foundation

class BookInfoDetailView: UIView, NibLoadable {

    @IBOutlet weak var btnAddWishlist: UIButton!
    @IBOutlet weak var btnRent: UIButton!
    
    func setupTexts(){
        btnRent.setTitle("aA", for: .normal)
    }
}
