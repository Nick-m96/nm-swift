//
//  AddNewView.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 25/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class AddNewView: UIScrollView, NibLoadable, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var txtDescription: UITextField! {
        didSet{ txtDescription.placeholder = "DESCRIPTION_PLACEHOLDER".localized() }
    }
    @IBOutlet weak var txtTopic: UITextField! {
        didSet{ txtTopic.placeholder = "TOPIC_PLACEHOLDER".localized() }
    }
    @IBOutlet weak var txtYear: UITextField! {
        didSet{  txtYear.placeholder = "YEAR_PLACEHOLDER".localized() }
    }
    @IBOutlet weak var txtAuthor: UITextField! {
        didSet{  txtAuthor.placeholder = "AUTHOR_PLACEHOLDER".localized() }
    }
    @IBOutlet weak var txtBookName: UITextField! {
        didSet{ txtBookName.placeholder = "BOOK_NAME_PLACEHOLDER".localized() }
    }
    @IBOutlet weak var btnSubmit: UIButton! {
        didSet{ btnSubmit.setTitle("BTN_SUBMIT".localized(), for: .normal) }
    }
    @IBOutlet weak var btnImagePicker: UIButton!

    
    override func awakeFromNib() {
        backgroundColor = UIColor.white
        layer.cornerRadius = 10
        contentSize.height = 450
    }
    
    func setConstraints(fromView : UIView){
        translatesAutoresizingMaskIntoConstraints = false
        let left = trailingAnchor.constraint(equalTo: fromView.trailingAnchor, constant: -15)
        let top = topAnchor.constraint(equalTo: fromView.topAnchor, constant: 80)
        let right = leadingAnchor.constraint(equalTo: fromView.leadingAnchor, constant: 15)
        
        fromView.addConstraints([left, top, right])
    }
}
