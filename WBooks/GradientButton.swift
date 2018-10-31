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
        layer.cornerRadius = 15
        layer.masksToBounds = true
        tintColor = UIColor.white
        setEnable()
    }
    
    func setEnable(){
        self.gradient = ViewGradient(colors: [WBookColor.gradientLeft, WBookColor.gradientRight], direction: GradientDirection.leftToRight)
    }
    
    func setDisable(){
        self.gradient = ViewGradient(colors: [UIColor.gray, UIColor.gray], direction: GradientDirection.leftToRight)
    }
}
