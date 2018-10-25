//
//  WBookTextFieldStyle.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 25/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

class WBookTextFieldStyle: UITextField {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.placeholder = "Book\'s name"
        self.borderStyle = .none
        
    }

}
