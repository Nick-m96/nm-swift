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
    var libros: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        libros = createArray()
        
    }
    
    func createArray() -> [Book]{
        var tempLib : [Book] = []
        
        let b1 = Book(title: "primero")
        let b2 = Book(title: "segundo")
        let b3 = Book(title: "tercero")
        let b4 = Book(title: "cuarto")
        let b5 = Book(title: "quinto")
        
        tempLib.append(b1)
        tempLib.append(b2)
        tempLib.append(b3)
        tempLib.append(b4)
        tempLib.append(b5)
        
        return tempLib
    }
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return libros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let libro = libros[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.setText(text: libro)
        
        return cell
    }
    
}
