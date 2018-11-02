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

    let bookDetailView = BookInfoDetailView.loadFromNib()! as BookInfoDetailView
    let headerCollectionView = HeaderCollectionView.loadFromNib()! as HeaderCollectionView
    let tableCommentVC = CommentTableViewController()
    let collectionBookVC = SuggestionCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = WBookColor.background
        contentSize.height = 1200
        
        addSubview(collectionBookVC.collectionView!)
        addSubview(bookDetailView)
        addSubview(headerCollectionView)
        addSubview(tableCommentVC.tableView)
        
        collectionBookVC.setConstraints(self, 360)
        tableCommentVC.setConstraints(self, 470)
        headerCollectionView.setConstraints(self, 330)
        bookDetailView.setConstraints(self, 60)
    }
    
    func getBook(book: Book) {
        bookDetailView.setupTexts(book: book)
        tableCommentVC.setBook(book)
    }
    
    func setConstraints(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        let hor = centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let top = topAnchor.constraint(equalTo: view.topAnchor, constant: -40)
        let wid = widthAnchor.constraint(equalTo: view.widthAnchor)
        let bottom = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        
        view.addConstraints([hor, top, wid, bottom])
    }
}
