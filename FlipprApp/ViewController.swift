//
//  ViewController.swift
//  FlipprApp
//
//  Created by Chris Kuan on 2019-03-29.
//  Copyright © 2019 Chris Kuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Properties
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameTextField.delegate = self
        
    }
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn (_ textField: UITextField) -> Bool {
        
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing (_ textField: UITextField) {
        itemNameLabel.text = nameTextField.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // Dimiss the picker if the user cancels
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info [UIImagePickerController.InfoKey.originalImage] as? UIImage else {fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")}
        
        // Set photoImageView to display the selected image
        photoImageView.image = selectedImage
        
        // Dismiss the picker
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        // Hide the keyboard
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image
        imagePickerController.delegate = self
        
        // Method asks ViewController to present the view controller defined by imagePickerController
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func setItemName(_ sender: UIButton) {
        itemNameLabel.text = nameTextField.text
    }
    
    
}

class Item: UILabel {
//create item class
//build constructor for new item object
//set item class methods and instance variables
//invoke constructor

    
}

