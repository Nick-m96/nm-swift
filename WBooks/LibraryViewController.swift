//
//  MainViewController.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 05/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Networking
import ReactiveSwift
import UIKit
import WolmoCore

final class LibraryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "NAVIGATION_BAR_TITLE_LIBRARY".localized()
        let tableBookVC = TableBookViewController()
        self.addChildViewController(tableBookVC)
        view.addSubview(tableBookVC.tableView)
        
//        tableBookVC.view.translatesAutoresizingMaskIntoConstraints = false
//        tableBookVC.view.topAnchor.constraint(equalTo: view.topAnchor, constant: navigationController!.navigationBar.frame.size.height).isActive = true
//        tableBookVC.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        tableBookVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
//        tableBookVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
    }
}
