//
//  GradientButton.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 23/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class GradientButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 20
        layer.masksToBounds = true
        setGradient()
    }
    
    func setGradient(){
        self.gradient = ViewGradient(colors: [WBookColor.gradientLeft, WBookColor.gradientRight], direction: GradientDirection.leftToRight)
    }
    
    func setNoGradient(){
        self.gradient = ViewGradient(colors: [UIColor.gray, UIColor.gray], direction: GradientDirection.leftToRight)
    }
}
