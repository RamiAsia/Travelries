//
//  MomentTableViewController.swift
//  Travelries
//
//  Created by Rami on 9/20/16.
//  Copyright © 2016 Rami. All rights reserved.
//

import UIKit

class MomentTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var moments = [Moment]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        
        // Load sample moments
        loadSampleMoments()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return moments.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "MomentTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MomentTableViewCell

        // Fetch the right moment
        let moment = moments[indexPath.row]
        
        cell.nameLabel.text = moment.name
        cell.momentPhoto.image = moment.photo
        
        var location = ""
        if let locality = moment.locality {
            location = locality
        }
        cell.locationLabel.text = location

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let momentDetailController = segue.destinationViewController as? MomentViewController {
            if segue.identifier == "ShowMoment" {
                if let selectedCell = sender as? MomentTableViewCell {
                    let indexPath = tableView.indexPathForCell(selectedCell)!
                    let selectedMoment = moments[indexPath.row]
                    momentDetailController.moment = selectedMoment
                }
            }
            else if segue.identifier == "AddItem" {
                print("Adding moment")
            }
        }
//        else if let addMomentController = segue.destinationViewController as? AddMomentViewController {
//            
//        }
    }

    
    // MARK: Actions
    
    
    func loadSampleMoments() {
        let photo1 = UIImage(named: "sample1")!
        let moment1 = Moment(name: "Skiing", momentDescription: "It was a beautiful moment. Purely white snow. Nothing else could be seen.", photo: photo1, locality: "Los Angeles", country: "Sweden", date: NSDate(), favorite: true)!
        
        let photo2 = UIImage(named: "sample2")!
        let moment2 = Moment(name: "Swimming with Rosa", momentDescription: "The water was clear and Rosa's mug made it weirdly incredibly memorable.", photo: photo2, locality: "Santa's House", country: "Russia", date: NSDate(), favorite: true)!
        
        let photo3 = UIImage(named: "sample3")!
        let moment3 = Moment(name: "Panning for Gold", momentDescription: "I lost my pan and searched for the gold with my teef. Wah hard buh I did i'.", photo: photo3, locality: "Rio", country: "Greenland", date: NSDate(), favorite: true)!
        
        moments += [moment1, moment2, moment3]
        
    }
    
    @IBAction func unwindToMomentList(sender: UIStoryboardSegue) {
        if let addMomentViewController = sender.sourceViewController as? AddMomentViewController, moment = addMomentViewController.moment {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update existing moment
                moments[selectedIndexPath.row] = moment
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            else {
                // Add new moment
                let newIndexPath = NSIndexPath(forRow: moments.count, inSection: 0)
                moments += [moment]
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom		)
            }
            
            
        }
    }

}
