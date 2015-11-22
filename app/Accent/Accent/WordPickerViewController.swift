//
//  WordPickerViewController.swift
//  Accent
//
//  Created by Richard Wei on 11/21/15.
//  Copyright © 2015 accent. All rights reserved.
//

import UIKit

class WordPickerViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var words: [String] = ["beef", "bed", "pat", "very", "oil", "good", "three", "six"]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ResourceCache.sharedCache["CalibrationImage"] = UIImage(named: "front_view_calibration")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        UIApplication.sharedApplication().statusBarStyle = .Default
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension WordPickerViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return words.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "wordCellIdentifier"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! WordPickerViewCell
        cell.wordButton.setTitle(words[indexPath.row], forState: .Normal)
        return cell
    }

    // Override to support conditional editing of the table view.
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

    // Override to support conditional rearranging of the table view.
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return false
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowWordView" {
            let wordViewController = segue.destinationViewController as! WordViewController
            if let button = sender as? UIButton, word = button.titleLabel?.text?.lowercaseString {
                wordViewController.word = word
                wordViewController.transitioningDelegate = TransitionManager.sharedManager
            }
        }
    }

    @IBAction func wordPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("ShowWordView", sender: sender)
    }
}
