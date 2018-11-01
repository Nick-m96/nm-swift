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
    private let _width: CGFloat = -30
    private let _header = HeaderCollectionView.loadFromNib()! as HeaderCollectionView
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = WBookColor.background
        navigationItem.title = "NAVIGATION_BAR_TITLE_RENTALS".localized()
        view.backgroundColor = WBookColor.background
        setCollectionBookVC()
        setHeaderCollection()
        setTableBook()
    }
    
    private func setHeaderCollection(){
        view.addSubview(_header)
        _header.setConstraints(view, -120)
    }

    private func setCollectionBookVC(){
        let collectionBookVC = SuggestionCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        self.addChildViewController(collectionBookVC)
        view.addSubview(collectionBookVC.collectionView!)
        collectionBookVC.setConstraints(view)

    }
    
    private func setTableBook(){
        let tableBookVC = TableBookViewController()
        self.addChildViewController(tableBookVC)
        view.addSubview(tableBookVC.tableView)
        tableBookVC.didSelectedEnable = true
        tableBookVC.setConstraints(view)
    }
}
