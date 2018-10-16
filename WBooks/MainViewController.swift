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

final class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let _bookRepo = NetworkingBootstrapper.shared.createWBooksRepository()
    private var _bookArray = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

extension MainViewController: UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _bookArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = _bookArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.setText(book: book)
        return cell
    }
}
