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
        if #available(iOS 11.0, *) {
            let searchController = UISearchController(searchResultsController: nil)
            navigationItem.searchController = searchController
        }
        navigationItem.title = "Wishlist"
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
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = selected
        navController.tabBarItem.selectedImage = unselected
        return navController
    }
}

