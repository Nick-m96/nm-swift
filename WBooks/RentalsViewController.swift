//
//  RentalsViewController.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 17/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Networking
import ReactiveSwift
import UIKit
import WolmoCore

class RentalsViewController: UIViewController {
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = WBookColor.background
        navigationItem.title = "NAVIGATION_BAR_TITLE_RENTALS".localized()
        let tableBookVC = TableBookViewController()
        self.addChildViewController(tableBookVC)
        view.addSubview(tableBookVC.tableView)
        tableBookVC.didSelectedEnable = true
    }
}
