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
        let addNewVM = AddNewView.loadFromNib()! as AddNewView
        addNewVM.setupText()
        setViewStyle(addNewVM)
        view.addSubview(addNewVM)
        setConstraints(addNewVM)
    }
    
    fileprivate func setViewStyle(_ addNewVM: AddNewView) {
        addNewVM.view.backgroundColor = UIColor.white
        addNewVM.view.layer.cornerRadius = 10
    }
    
    fileprivate func setConstraints(_ addNewVM: AddNewView) {
        addNewVM.translatesAutoresizingMaskIntoConstraints = false
        let hor = addNewVM.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let ver = addNewVM.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let height = addNewVM.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -150)
        let wid = addNewVM.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40)
        
        view.addConstraints([hor, ver, wid, height])
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
}
