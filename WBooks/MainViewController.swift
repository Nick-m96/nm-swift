//
//  MainViewController.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 05/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    let n = NetworkingBootstrapper.shared.bootstrap()
    let bookRepo = NetworkingBootstrapper.shared.createWBooksRepository()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
//       A mano
//        let libro = Book(id: 11, author: "String", title: "String", genre: "String", publisher: "String", year: "String")
//        libros.append(libro)

        let a = 20
        var b = a - 2
    }
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookRepo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let libro = bookRepo[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell

        cell.setText(text: libro)

        return cell
    }

}
