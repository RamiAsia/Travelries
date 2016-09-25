//
//  AddMomentViewController.swift
//  Travelries
//
//  Created by Rami on 9/25/16.
//  Copyright © 2016 Rami. All rights reserved.
//

import UIKit

class AddMomentViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var momentPhoto: UIImageView!
    @IBOutlet weak var momentName: UITextField!
    @IBOutlet weak var momentDescription: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the save button when editing
        saveButton.enabled = false
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
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
}
