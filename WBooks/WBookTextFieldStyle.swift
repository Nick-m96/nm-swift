//
//  WBookTextFieldStyle.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 25/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class WBookTextFieldStyle: UITextField {

    override func layoutSubviews() {
        super.layoutSubviews()
        borderStyle = .none
        layer.backgroundColor = UIColor.white.cgColor
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 0.0
    }

}
