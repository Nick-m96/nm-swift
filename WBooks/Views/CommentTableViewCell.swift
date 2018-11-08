//
//  ComentTableViewCell.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 01/11/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var comment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setComent(_ userComent : UserComment){
        userName.text = userComent.user.firstName + " " + userComent.user.lastName
        comment.text = userComent.comment
        if let imageURL = userComent.user.imageURL{
            do{
                try
                    userPhoto.image = UIImage(data: Data(contentsOf: imageURL))
            }
            catch{print("error")}
        }
        else{
            userPhoto.image = UIImage(named: "img-user")
        }

    }
    
}
