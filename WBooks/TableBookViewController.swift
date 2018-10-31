//
//  TableBookViewController.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 25/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Networking
import ReactiveSwift
import UIKit
import WolmoCore

final class TableBookViewController: UITableViewController {
    
    private let _bookRepo = NetworkingBootstrapper.shared.createWBooksRepository()
    private var _bookArray = [Book]()
    private var _AllBooksRead = false
    public var didSelectedEnable = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "BookTableCell", bundle: nil), forCellReuseIdentifier: "BookTableCell")
        setTableBackground()
        loadBooks()
    }
    
    func loadBooks(){
        if !_AllBooksRead {
            _bookRepo.fetchBooks().observe(on: UIScheduler()).startWithResult{
                [unowned self] in
                switch $0 {
                case .success(let books):
                    self._AllBooksRead = (books.count == 0)
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
        tableView.backgroundColor = WBookColor.background
        tableView.separatorStyle = .none
    }
}

extension TableBookViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _bookArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = _bookArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableCell", for: indexPath) as! BookTableCell
        cell.setBook(book: book)
        if indexPath.row == _bookArray.count - 1 { // last cell
            loadBooks()
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if didSelectedEnable{
            let book = _bookArray[indexPath.row]
            let BookDetailVC = BookInfoDetailViewController()
            BookDetailVC.bookDetailView.setupTexts(book: book)
            navigationController?.pushViewController(BookDetailVC, animated: true)
        }
    }
}

extension TableBookViewController{
    func setConstraints(_ view : UIView) {
        guard let tableView = tableView else {
            return
        }
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let hor = tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let botton = tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160)
        let height = tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
        let wid = tableView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30)
        
        view.addConstraints([hor, botton, wid, height])
    }
}
