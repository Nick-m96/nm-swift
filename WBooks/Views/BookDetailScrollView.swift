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

    private let _bookDetailView = BookInfoDetailView.loadFromNib()! as BookInfoDetailView
    private let _headerCollectionView = HeaderCollectionView.loadFromNib()! as HeaderCollectionView
    private var _tableCommentVC : CommentTableViewController!
    private let _collectionBookVC = SuggestionCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = WBookColor.background
        contentSize.height = 1200
        
        addSubview(_collectionBookVC.collectionView!)
        addSubview(_bookDetailView)
        addSubview(_headerCollectionView)
        
        _collectionBookVC.setConstraints(self, 330)
        _headerCollectionView.setConstraints(self, 300)
        _bookDetailView.setConstraints(self, 50)
    }
    
    func setBook(_ book: Book) {
        _bookDetailView.setupTexts(book)
        _tableCommentVC = CommentTableViewController(book.id)
        
        addSubview(_tableCommentVC.tableView)
        _tableCommentVC.setConstraints(self, 430)
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
