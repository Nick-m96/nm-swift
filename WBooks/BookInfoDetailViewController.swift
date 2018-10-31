//
//  BookInfoDetailViewController.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 24/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

class BookInfoDetailViewController: UIViewController {
    let bookDetail = BookInfoDetailView.loadFromNib()! as BookInfoDetailView

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = WBookColor.background
    }
    
    fileprivate func setConstraints() {
        bookDetail.translatesAutoresizingMaskIntoConstraints = false
        bookDetail.topAnchor.constraint(equalTo: view.topAnchor, constant: navigationController!.navigationBar.frame.size.height).isActive = true
        bookDetail.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bookDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        bookDetail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(self.bookDetail)
        setConstraints()
    }
}
