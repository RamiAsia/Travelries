//
//  AddMomentViewController.swift
//  Travelries
//
//  Created by Rami on 9/25/16.
//  Copyright © 2016 Rami. All rights reserved.
//

import UIKit

class AddMomentViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var momentPhoto: UIImageView!
    @IBOutlet weak var momentName: UITextField!
    @IBOutlet weak var momentDescription: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var moment: Moment?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (sender as! UIBarButtonItem) === saveButton {
            let name = momentName.text ?? ""
            let photo = momentPhoto.image
            let description = momentDescription.text
            
            // Create Moment from the data entered
            moment = Moment(name: name, momentDescription: description!, photo: photo, locality: nil, country: nil, date: Date(), favorite: false)
            
            
            
        }
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        navigationItem.title = textField.text
//        if isClearText(textField.text) {
//            saveButton.enabled = false
//        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the save button when editing
        saveButton.isEnabled = false
    }
    
    // MARK: UITextViewDelegate
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        saveButton.isEnabled = false
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if isClearText(textView.text) {
            saveButton.isEnabled = false
        }
        else {
            saveButton.isEnabled = true
        }
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set Moment Photo to selected image
        momentPhoto.image = selectedImage
        
        // Dismiss the picker
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: Actions

    @IBAction func shootImageFromCamera(_ sender: UITapGestureRecognizer) {
        print("Should open gallery")
        // Hide the keyboard if open
        momentName.resignFirstResponder()
        momentDescription.resignFirstResponder()
        
//        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            // Create UIImagePickerController to get new image
            let imagePickerController = UIImagePickerController()
            
            // Make sure the user shoots new picture of moment
            imagePickerController.sourceType = .photoLibrary
            
            // Set the ViewController as the delegate to be notified when picture is taken
            imagePickerController.delegate = self
            
            imagePickerController.allowsEditing = false
            
            self.present(imagePickerController, animated: true, completion: nil)
            
//        }
//        else {
//            print("No camera available")
//        }
    }
    
    func isClearText(_ text: String) -> Bool {
        return text == ""
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
