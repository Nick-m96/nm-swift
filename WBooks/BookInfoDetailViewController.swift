//
//  BookInfoDetailViewController.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 24/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Networking
import ReactiveSwift
import UIKit
import WolmoCore

class BookInfoDetailViewController: UIViewController {
    let bookDetailView = BookInfoDetailView.loadFromNib()! as BookInfoDetailView
    let headerCollectionView = HeaderCollectionView.loadFromNib()! as HeaderCollectionView
    let tableCommentVC = CommentTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = WBookColor.background
    }
    
    override func loadView() {
        super.loadView()
        self.addChildViewController(tableCommentVC)
        view.addSubview(bookDetailView)
        view.addSubview(headerCollectionView)
        view.addSubview(tableCommentVC.tableView)
        
        tableCommentVC.setConstraints(view, 370)
        headerCollectionView.setConstraints(view, 330)
        bookDetailView.setConstraints(view, 80)
    }
}
