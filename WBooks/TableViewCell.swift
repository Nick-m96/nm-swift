//
//  TableViewCell.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 08/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var LabelText: UILabel!
    
    func setText(text: Book){
        LabelText.text = text.title
    }

}
