//
//  MainTabBarViewController.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 17/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupNavBar()
    }
    
    func setupNavBar(){
        let backgroundNav = UIImage(named: "Background-navBar")
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.white]
        UINavigationBar.appearance().setBackgroundImage(backgroundNav?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch), for: .default)
        UINavigationBar.appearance().barStyle = .blackOpaque
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    func setupTabBar(){
        let library = createNavController(vc: LibraryViewController(), selected: UIImage(named: "library-blue")!, unselected: UIImage(named: "library-grey")!)
        let addNew = createNavController(vc: AddNewViewController(), selected: UIImage(named: "add-new-blue")!, unselected: UIImage(named: "add-new-grey")!)
        let wishList = createNavController(vc: WishListViewController(), selected: UIImage(named: "wishlist-blue")!, unselected: UIImage(named: "wishlist-grey")!)
        let rentals = createNavController(vc: RentalsViewController(), selected: UIImage(named: "rentals-blue")!, unselected: UIImage(named: "rentals-grey")!)
        viewControllers = [library, wishList, addNew, rentals]
    }
}

extension UIViewController{
    func createNavController(vc: UIViewController, selected: UIImage, unselected: UIImage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.image = selected
        navController.tabBarItem.selectedImage = unselected
        return navController
    }
}

