//
//  SuggestionBookCollectionCellCollectionViewCell.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 30/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

class SuggestionBookCollectionCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgBook: UIImageView!
    
    func setBook(book: UIImage){
        imgBook.image = book
    }
}
