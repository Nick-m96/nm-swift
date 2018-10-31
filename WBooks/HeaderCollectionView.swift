//
//  HeaderCollectionView.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 30/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class HeaderCollectionView: UICollectionReusableView, NibLoadable {
    @IBOutlet weak var lblSuggestion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblSuggestion.text = "LBL_SUGGESTIONS".localized()
        
    }
    
     func setConstraints(_ viewSet: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        let hor = centerXAnchor.constraint(equalTo: viewSet.centerXAnchor)
        let botton = bottomAnchor.constraint(equalTo: viewSet.bottomAnchor, constant: -120)
        let height = heightAnchor.constraint(equalToConstant: 37)
        let wid = widthAnchor.constraint(equalTo: viewSet.widthAnchor, constant: -30)
        
        viewSet.addConstraints([hor, botton, wid, height])
    }
}
