//
//  TableViewCell.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 08/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    @IBOutlet weak var imgBook: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var lblAuthor: UILabel!
    
    
    func setText(book: Book){
        lblTitle.text = book.title
        lblTitle.numberOfLines = 0
        lblAuthor.text = book.author
        //let imageURL = "https://marketplace.canva.com/MACBTyJGXXY/1/0/thumbnail_large/canva-purple-paint-strokes-abstract-art-creativity-book-cover-MACBTyJGXXY.jpg"
        
        if let imageURL = book.image{
            do{
                try imgBook.image = UIImage(data: Data(contentsOf: URL(string: imageURL)!))
            }
            catch{print("error")}
        }
    }
}
