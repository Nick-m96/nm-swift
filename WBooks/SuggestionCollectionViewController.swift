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
    
    private let _image = UIImage(named: "book")
    private let _headerID = "header"
    private let _BookCell = "SuggestionCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView!.register(UINib(nibName: "SuggestionBookCollectionCell", bundle: nil), forCellWithReuseIdentifier: _BookCell)
        collectionView?.backgroundColor = UIColor.clear
    
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 60, height: 80)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0.0
        collectionView?.collectionViewLayout = flowLayout
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: _BookCell, for: indexPath) as! SuggestionBookCollectionCellCollectionViewCell
        cell.setBook(book: _image!)
        return cell
    }
    
    func setConstraints(_ view : UIView) {
        collectionView!.translatesAutoresizingMaskIntoConstraints = false
        let hor = collectionView!.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let botton = collectionView!.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        let height = collectionView!.heightAnchor.constraint(equalToConstant: 80)
        let wid = collectionView!.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30)
        
        view.addConstraints([hor, botton, wid, height])
    }
}
