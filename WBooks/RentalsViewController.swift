//
//  RentalsViewController.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 17/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import WolmoCore
import Foundation

class RentalsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.title = "NAVIGATION_BAR_TITLE_RENTALS".localized()
        view.backgroundColor = UIColor.white
    }
    
    override func loadView() {
        super.loadView()
        view = BookInfoDetailView.loadFromNib()
    }
}
