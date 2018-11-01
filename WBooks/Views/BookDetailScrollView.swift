//
//  BookDetailScrollView.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 01/11/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Networking
import ReactiveSwift
import UIKit
import WolmoCore

class BookDetailScrollView: UIScrollView, NibLoadable {

    func setConstraints(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        let hor = centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let top = topAnchor.constraint(equalTo: view.topAnchor, constant: -40)
        let wid = widthAnchor.constraint(equalTo: view.widthAnchor)
        let bottom = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        contentSize.height = 1200
        view.addConstraints([hor, top, wid, bottom])
    }
    
    let bookDetailView = BookInfoDetailView.loadFromNib()! as BookInfoDetailView
    let headerCollectionView = HeaderCollectionView.loadFromNib()! as HeaderCollectionView
    let tableCommentVC = CommentTableViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = WBookColor.background
        
        addSubview(tableCommentVC.tableView)
        addSubview(bookDetailView)
        addSubview(headerCollectionView)
        addSubview(tableCommentVC.tableView)
        
        tableCommentVC.setConstraints(self, 370)
        headerCollectionView.setConstraints(self, 330)
        bookDetailView.setConstraints(self, 80)
    }
}
