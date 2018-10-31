//
//  BookInfoDetailCell.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 22/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import WolmoCore
import Foundation

class BookInfoDetailView: UIView, NibLoadable {

    @IBOutlet weak var btnAddWishlist: UIButton!
    @IBOutlet weak var btnRent: UIButton!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookYear: UILabel!
    @IBOutlet weak var bookGenre: UILabel!
    
    override func awakeFromNib() {
        btnRent.setTitle("BUTTON_RENT".localized(), for: .normal)
        btnAddWishlist.setTitle("BUTTON_ADD_WISHLIST".localized(), for: .normal)
    }
    
    func setupTexts(book : Book){
        bookTitle.text = book.title
        bookAuthor.text = book.author
        bookYear.text = book.year
        bookGenre.text = book.genre
        if let imageURL = book.image{
            do{
                try
                bookImage.image = UIImage(data: Data(contentsOf: URL(string: imageURL)!))
                
            }
            catch{print("error")}
        }
        
    }
}
