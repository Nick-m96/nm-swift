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
import WolmoCore

final class LibraryViewController: UITableViewController {
    
    private let _bookRepo = NetworkingBootstrapper.shared.createWBooksRepository()
    private var _bookArray = [Book]()
    private var _AllBooksRead = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "NAVIGATION_BAR_TITLE_LIBRARY".localized()
        tableView.register(UINib(nibName: "BookCell", bundle: nil), forCellReuseIdentifier: "BookCell")
        setTableBackground()
        loadBooks()
        
    }
    
    func loadBooks(){
        if _AllBooksRead == false {
            _bookRepo.fetchBooks().observe(on: UIScheduler()).startWithResult{
                switch $0 {
                case .success(let books):
                    if (books.count == 0) {
                        self._AllBooksRead = true
                    }
                    for book in books{
                        self._bookArray.append(book)
                    }
                    
                    self.tableView.reloadData()
                case .failure(let error):  print("\(error)")
                }
            }
        }
        
    }
    
    func setTableBackground(){
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.wBooksBackground
    }
}

extension LibraryViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _bookArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = _bookArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        cell.setText(book: book)
        
        if indexPath.row == _bookArray.count - 1 { // last cell
            loadBooks()
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

internal extension UIColor {
    
    static var wBooksBackground: UIColor {
        return UIColor(red: 234/255, green: 246/255, blue: 250/255, alpha: 1)
    }
    
}
