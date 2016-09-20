//
//  MomentViewController.swift
//  Travelries
//
//  Created by Rami on 9/20/16.
//  Copyright © 2016 Rami. All rights reserved.
//

import UIKit

class MomentViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var momentDescription: UITextView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var momentPhoto: UIImageView!
    @IBOutlet weak var locationLAbel: UILabel!
    
    var moment: Moment?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let moment = moment {
            navigationItem.title = moment.name
            momentDescription.text = moment.momentDescription
            momentPhoto.image = moment.photo
            var location = ""
            if let locality = moment.locality {
                location = locality
            }
            locationLabel.text = location
        }
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

}
