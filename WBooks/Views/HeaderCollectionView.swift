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
    private let _height : CGFloat = 37
    private let _width : CGFloat = -30
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblSuggestion.text = "LBL_SUGGESTIONS".localized()
    }
    
    func setConstraints(_ viewSet: UIView,_ top : CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        let hor = centerXAnchor.constraint(equalTo: viewSet.centerXAnchor)
        var up : NSLayoutConstraint
        if top < (0 as CGFloat) {
            up = bottomAnchor.constraint(equalTo: viewSet.bottomAnchor, constant: top)
        }
        else{
            up = topAnchor.constraint(equalTo: viewSet.topAnchor, constant: top)
        }
            
        let height = heightAnchor.constraint(equalToConstant: _height)
        let wid = widthAnchor.constraint(equalTo: viewSet.widthAnchor, constant: _width)
        
        viewSet.addConstraints([hor, up, wid, height])
    }
}
