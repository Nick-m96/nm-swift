//
//  AddNewViewController.swift
//  WBooks
//
//  Created by Nicolas Manograsso on 17/10/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import WolmoCore
import ReactiveCocoa
import ReactiveSwift

class AddNewViewController: UIViewController {
    private let addNewVM = AddNewView.loadFromNib()! as AddNewView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "NAVIGATION_BAR_TITLE_ADDNEW".localized()
        view.backgroundColor = WBookColor.background
        
        addNewVM.btnImagePicker.reactive.controlEvents(.touchUpInside).observeValues { [unowned self] btn in
            self.pickImage()
        }
    }

    override func loadView() {
        super.loadView()
        addNewVM.setConstraints(fromView : view)
        view.addSubview(addNewVM)
    }
}

extension  AddNewViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    fileprivate func pickImage(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let actions = UIAlertController(title: "PHOTOSOURCE".localized(), message: "CHOOSEORIGINIMAGE".localized(), preferredStyle: .actionSheet)
        
        actions.addAction(UIAlertAction(title: "CAMERA".localized(), style: .default, handler: {
            (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }
            else{
                print("CAMERANOTAVAILABLE".localized())
            }}))
        
        actions.addAction(UIAlertAction(title: "GALLERYPHOTO".localized(), style: .default, handler: {
            (action:UIAlertAction) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)}))
        
        actions.addAction(UIAlertAction(title: "CANCEL".localized(), style: .cancel, handler: nil))
        
        self.present(actions, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        addNewVM.btnImagePicker.setBackgroundImage(image, for: .normal)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
