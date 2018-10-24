//
//  ButtonStyle.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 23/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit

class RoundedBuuton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.masksToBounds = true
        tintColor = WBookColor.gradientLeft
        layer.borderColor = tintColor.cgColor
    }
}
