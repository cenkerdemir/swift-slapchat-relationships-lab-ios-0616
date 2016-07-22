//
//  RecepientTableTableViewController.swift
//  SlapChat
//
//  Created by Cenker Demir on 7/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class RecepientTableTableViewController: UITableViewController {
    
    var managedRecepients: [Recepient] = []
    let store: DataStore = DataStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.fetchData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        print(store)
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(true)
        store.fetchData()
        tableView.reloadData()
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
        return store.recepients.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("basicRecepientCell", forIndexPath: indexPath)

        // Configure the cell...
        let eachRecepient = store.recepients[indexPath.row]
        cell.textLabel?.text = eachRecepient.name
        
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let destinationVC = segue.destinationViewController as! TableViewController
        
        print(store)
        print(store.recepients)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            if let messagesSet = store.recepients[indexPath.row].message {
                destinationVC.setForMessages = messagesSet
            }
        }
    }
}
