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
    let _widht: CGFloat = -30
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = WBookColor.background
        navigationItem.title = "NAVIGATION_BAR_TITLE_RENTALS".localized()
        view.backgroundColor = UIColor(red: 234/255, green: 246/255, blue: 250/255, alpha: 1)
        setCollectionBookVC()
        setHeaderCollection()
        setTableBook()
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
        setConstraints(collectionBookVC.collectionView!, 80, -40)

    }
    
    private func setTableBook(){
        let tableBookVC = TableBookViewController()
        self.addChildViewController(tableBookVC)
        view.addSubview(tableBookVC.tableView)
        tableBookVC.didSelectedEnable = true
        setConstraints(tableBookVC.tableView, 0, -160)
    }
    
    fileprivate func setConstraints(_ viewSet: UIView, _ heightTop: CGFloat, _ botton: CGFloat) {
        viewSet.translatesAutoresizingMaskIntoConstraints = false
        let hor = viewSet.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let botton = viewSet.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: botton)
        var height : NSLayoutConstraint
        if(heightTop != 0){
            height = viewSet.heightAnchor.constraint(equalToConstant: heightTop)}
        else{
            height = viewSet.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)}
        let wid = viewSet.widthAnchor.constraint(equalTo: view.widthAnchor, constant: _widht)
        
        view.addConstraints([hor, botton, wid, height])
    }
}
