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

    var bookID : Int?
    private let _commentRepo = NetworkingBootstrapper.shared.createUserCommentRepository()
    private var _commentsArray = [UserComment]()
    private let _cellSize : CGFloat = 140
    private var _rows : Int!
    private var _view : UIScrollView!
    private let _width : CGFloat = -30
    private let _heigthOfScrollView : CGFloat = 450
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentTableViewCell")
        setTableBackground()
    }
    
    func setBookID(_ bookID : Int){
        self.bookID = bookID
        loadComments()
    }
    
    func loadComments(){
        _commentRepo.fetchComments(bookID!).observe(on: UIScheduler()).startWithResult{
            [unowned self] in
            switch $0 {
            case .success(let comments):
                for comment in comments{
                    self._commentsArray.append(comment)
                }
                self.tableView.reloadData()
                self.setHeight(CGFloat(self._rows) * self._cellSize)
            case .failure(let error):  print("\(error)")
            }
        }
    }
    
    func setTableBackground(){
        tableView.backgroundColor = UIColor.white
        tableView.layer.cornerRadius = 10
    }
    
    func setConstraints(_ viewSet: UIView, _ top : CGFloat){
        _view = viewSet as? UIScrollView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let hor = tableView.centerXAnchor.constraint(equalTo: viewSet.centerXAnchor)
        let top = tableView.topAnchor.constraint(equalTo: viewSet.topAnchor, constant: top)
        let wid = tableView.widthAnchor.constraint(equalTo: viewSet.widthAnchor, constant: _width)
        
        viewSet.addConstraints([hor, top, wid])
    }
    
    func setHeight(_ height : CGFloat) {
        let heightConstraint = tableView!.heightAnchor.constraint(equalToConstant: height)
        _view.addConstraints([heightConstraint])
        _view.contentSize.height = CGFloat(_heigthOfScrollView) + height
    }
}

extension CommentTableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        _rows = _commentsArray.count > 5 ? 5 : _commentsArray.count
        return _rows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comment = _commentsArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell 
        cell.setComent(comment)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return _cellSize
    }
}
