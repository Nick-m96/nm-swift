//
//  BookInfoDetailViewController.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 24/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

class BookInfoDetailViewController: UIViewController {
    let bookDetailView = BookInfoDetailView.loadFromNib()! as BookInfoDetailView
    let headerCollectionView = HeaderCollectionView.loadFromNib()! as HeaderCollectionView

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = WBookColor.background
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(bookDetailView)
        view.addSubview(headerCollectionView)
        
        headerCollectionView.setConstraints(view, 330)
        bookDetailView.setConstraints(view, 80)
    }
}
