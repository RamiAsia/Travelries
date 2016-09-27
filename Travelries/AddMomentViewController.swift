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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if sender === saveButton {
            let name = momentName.text ?? ""
            let photo = momentPhoto.image
            let description = momentDescription.text
            
            // Create Moment from the data entered
            moment = Moment(name: name, momentDescription: description, photo: photo, locality: nil, country: nil, date: NSDate(), favorite: false)
            
            
            
        }
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        navigationItem.title = textField.text
//        if isClearText(textField.text) {
//            saveButton.enabled = false
//        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the save button when editing
        saveButton.enabled = false
    }
    
    // MARK: UITextViewDelegate
    
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        saveButton.enabled = false
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if isClearText(textView.text) {
            saveButton.enabled = false
        }
        else {
            saveButton.enabled = true
        }
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set Moment Photo to selected image
        momentPhoto.image = selectedImage
        
        // Dismiss the picker
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: Actions

    @IBAction func shootImageFromCamera(sender: UITapGestureRecognizer) {
        
        // Hide the keyboard if open
        momentName.resignFirstResponder()
        momentDescription.resignFirstResponder()
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            // Create UIImagePickerController to get new image
            let imagePickerController = UIImagePickerController()
            
            // Make sure the user shoots new picture of moment
            imagePickerController.sourceType = .Camera
            
            // Set the ViewController as the delegate to be notified when picture is taken
            imagePickerController.delegate = self
            
            imagePickerController.allowsEditing = false
            
            self.presentViewController(imagePickerController, animated: true, completion: nil)
            
        }
        else {
            print("No camera available")
        }
    }
    
    func isClearText(text: String) -> Bool {
        return text == ""
    }
}
