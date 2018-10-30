//
//  TableViewCell.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 08/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

class BookTableCell: UITableViewCell {

    @IBOutlet weak var imgBook: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    
    func setText(book: Book){
        lblTitle.text = book.title
        lblAuthor.text = book.author
        if let imageURL = book.image{
            do{
                try imgBook.image = UIImage(data: Data(contentsOf: URL(string: imageURL)!))
            }
            catch{print("error")}
        }
    }
}
