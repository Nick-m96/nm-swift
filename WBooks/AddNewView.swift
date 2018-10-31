//
//  AddNewView.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 25/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class AddNewView: UIScrollView, NibLoadable{
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var txtTopic: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var txtAuthor: UITextField!
    @IBOutlet weak var txtBookName: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var imgBook: UIButton!
    
    override func awakeFromNib() {
        btnSubmit.setTitle("BTN_SUBMIT".localized(), for: .normal)
        txtBookName.placeholder = "BOOK_NAME_PLACEHOLDER".localized()
        txtAuthor.placeholder = "AUTHOR_PLACEHOLDER".localized()
        txtYear.placeholder = "YEAR_PLACEHOLDER".localized()
        txtTopic.placeholder = "TOPIC_PLACEHOLDER".localized()
        txtDescription.placeholder = "DESCRIPTION_PLACEHOLDER".localized()
    }
}
