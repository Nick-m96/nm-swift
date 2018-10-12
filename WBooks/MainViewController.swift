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
    
    let bookRepo = NetworkingBootstrapper.shared.createWBooksRepository()
    var bookArray = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookRepo.fetchEntities().observe(on: UIScheduler()).startWithResult{
            switch $0 {
            case .success(let b):
                self.bookArray = b
                self.tableView.reloadData()
            case .failure(let error):  print("\(error)")
            }
            
        }
        
        
        
//       A mano
//        let libro = Book(id: 11, author: "String", title: "String", genre: "String", publisher: "String", year: "String")
//        libros.append(libro)

    }
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let libro = bookArray[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell

        cell.setText(book: libro)

        return cell
    }

}
