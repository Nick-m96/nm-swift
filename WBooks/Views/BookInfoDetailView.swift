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
    private let _height : CGFloat = 250
    
    override func awakeFromNib() {
        btnRent.setTitle("BUTTON_RENT".localized(), for: .normal)
        btnAddWishlist.setTitle("BUTTON_ADD_WISHLIST".localized(), for: .normal)
        backgroundColor = UIColor.white
        layer.cornerRadius = 10
    }
    
    func setupTexts(_ book : Book){
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
    
    func setConstraints(_ view: UIView,_ top : CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        let hor = centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let top = topAnchor.constraint(equalTo: view.topAnchor, constant: top)
        let height = heightAnchor.constraint(equalToConstant: _height)
        let wid = widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30)
        
        view.addConstraints([hor, top, wid, height])
    }
}
