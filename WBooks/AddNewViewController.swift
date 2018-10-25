//
//  AddNewViewController.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 17/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class AddNewViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "NAVIGATION_BAR_TITLE_ADDNEW".localized()
        view.backgroundColor = WBookColor.background
    }
    
    override func loadView() {
        super.loadView()
        let addNewV = AddNewView.loadFromNib()! as AddNewView
        addNewV.setupText()
        view.addSubview(addNewV)
        
        addNewV.translatesAutoresizingMaskIntoConstraints = false
        let hor = addNewV.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let ver = addNewV.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let height = addNewV.heightAnchor.constraint(equalTo: view.heightAnchor)
        let wid = addNewV.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40)
        view.addConstraints([hor, ver, height, wid])
//        addNewV.imgBook.reactive.pressed
    }
    
    override func loadView() {
        super.loadView()
        let addNewV = AddNewView.loadFromNib()! as AddNewView
        view.addSubview(addNewV)
    }
}
