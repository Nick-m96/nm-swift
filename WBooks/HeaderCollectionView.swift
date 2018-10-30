//
//  HeaderCollectionView.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 30/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class HeaderCollectionView: UICollectionReusableView {

    @IBOutlet weak var lblSuggestion: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        lblSuggestion.text = "LBL_SUGGESTIONS".localized()
    }
    
}
