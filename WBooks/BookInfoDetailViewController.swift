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

    let scrollView = BookDetailScrollView.loadFromNib()! as BookDetailScrollView

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = WBookColor.background
        navigationItem.title = "NAVIGATION_BAR_TITLE_BOOKDETAIL".localized()
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(scrollView)
        scrollView.setConstraints(view)
    }
}
