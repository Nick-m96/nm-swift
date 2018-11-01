//
//  CommentTableViewController.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 01/11/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Networking
import ReactiveSwift
import UIKit
import WolmoCore

class CommentTableViewController: UITableViewController {

    private let _commentRepo = NetworkingBootstrapper.shared.createUserCommentRepository()
    private var _commentsArray = [UserComment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentTableViewCell")
        setTableBackground()
        loadBooks()
    }
    
    func loadBooks(){
        _commentRepo.fetchComments().observe(on: UIScheduler()).startWithResult{
            [unowned self] in
            switch $0 {
            case .success(let comments):
                for comment in comments{
                    self._commentsArray.append(comment)
                }
                
                self.tableView.reloadData()
            case .failure(let error):  print("\(error)")
            }
        }
    }
    
    func setTableBackground(){
        tableView.backgroundColor = UIColor.white
        tableView.layer.cornerRadius = 10
    }
    
    func setConstraints(_ viewSet: UIView, _ top : CGFloat){
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let hor = tableView.centerXAnchor.constraint(equalTo: viewSet.centerXAnchor)
        let top = tableView.topAnchor.constraint(equalTo: viewSet.topAnchor, constant: top)
        let height = tableView.heightAnchor.constraint(equalToConstant: 120)
        let wid = tableView.widthAnchor.constraint(equalTo: viewSet.widthAnchor, constant: -30)
        
        viewSet.addConstraints([hor, top, wid, height])
    }
}

extension CommentTableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = _commentsArray.count > 5 ? 5 : _commentsArray.count
        return rows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comment = _commentsArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell 
        cell.setComent(comment)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
