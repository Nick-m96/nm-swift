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
        view.backgroundColor = UIColor(red: 234/255, green: 246/255, blue: 250/255, alpha: 1)
        setCollectionBookVC()
        setHeaderCollection()
    }
    
    private func setHeaderCollection(){
        let header = HeaderCollectionView.loadFromNib()! as HeaderCollectionView
        view.addSubview(header)
        setConstraints(header, 37, -120)
    }

    private func setCollectionBookVC(){
        let collectionBookVC = SuggestionCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        self.addChildViewController(collectionBookVC)
        view.addSubview(collectionBookVC.collectionView!)
        setConstraints(collectionBookVC.collectionView!)
        let tableBookVC = TableBookViewController()
        self.addChildViewController(tableBookVC)
        view.addSubview(tableBookVC.tableView)
        tableBookVC.didSelectedEnable = true
    }
    
    fileprivate func setConstraints(_ viewSet: UIView, _ height: CGFloat, _ botton: CGFloat) {
        viewSet.translatesAutoresizingMaskIntoConstraints = false
        let hor = viewSet.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let botton = viewSet.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: botton)
        let height = viewSet.heightAnchor.constraint(equalToConstant: height)
        let wid = viewSet.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40)
        
        view.addConstraints([hor, botton, wid, height])
    }
}
