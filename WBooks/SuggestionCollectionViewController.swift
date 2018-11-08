//
//  SuggestionCollectionViewController.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 30/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import WolmoCore
import Foundation
import Networking

class SuggestionCollectionViewController: UICollectionViewController {
    private let _width : CGFloat = -30
    private let _height : CGFloat = 80
    private let _image = UIImage(named: "book")
    private let _BookCell = "SuggestionCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(UINib(nibName: "SuggestionBookCollectionCell", bundle: nil), forCellWithReuseIdentifier: _BookCell)
        collectionView.backgroundColor = UIColor.clear
    
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 60, height: 80)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0.0
        collectionView.collectionViewLayout = flowLayout
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: _BookCell, for: indexPath) as! SuggestionBookCollectionCellCollectionViewCell
        cell.setBook(book: _image!)
        return cell
    }
    
    func setConstraints(_ view : UIView, _ top : CGFloat) {
        guard let collectionView = collectionView else {
            return
        }
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let hor = collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        var up : NSLayoutConstraint
        if top < (0 as CGFloat) {
            up = collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: top)
        }
        else{
            up = collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: top)
        }
        let height = collectionView.heightAnchor.constraint(equalToConstant: _height)
        let wid = collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: _width)
        
        view.addConstraints([hor, up, height, wid])
    }
}
