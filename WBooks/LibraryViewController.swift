//
//  MainViewController.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 05/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Networking
import ReactiveSwift
import UIKit

final class LibraryViewController: UITableViewController {
    
    private let _bookRepo = NetworkingBootstrapper.shared.createWBooksRepository()
    private var _bookArray = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = NSLocalizedString("NAVIGATION_BAR_TITLE_LIBRARY", comment: "")
        
        _bookRepo.fetchBooks().observe(on: UIScheduler()).startWithResult{
            switch $0 {
            case .success(let books):
                self._bookArray = books
                self.tableView.reloadData()
            case .failure(let error):  print("\(error)")
            }
        }
    }
}

extension LibraryViewController{

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _bookArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = _bookArray[indexPath.row]
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        cell.setText(book: book)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

