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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = WBookColor.background
    }
    
    fileprivate func setConstraints() {
        bookDetailView.translatesAutoresizingMaskIntoConstraints = false
        bookDetailView.topAnchor.constraint(equalTo: view.topAnchor, constant: navigationController!.navigationBar.frame.size.height + 10).isActive = true
        bookDetailView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bookDetailView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 10).isActive = true
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(bookDetailView)
        setConstraints()
    }
}
