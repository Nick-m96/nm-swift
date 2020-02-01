//
//  WishListViewController.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 17/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class WishListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "NAVIGATION_BAR_TITLE_WISHLIST".localized()
        view.backgroundColor = WBookColor.background
    }
}
