//
//  PresidentViewController.swift
//  RDadi-USFounders
//
//  Created by Revanth Reddy Dadi on 27/09/18.
//  Copyright © 2018 Revanth Reddy Dadi. All rights reserved.
//
/*
 Author:        Revanth Reddy Dadi
 
 About application: It uses table View controller to represent a table of data about the founders of USA. The initial navigation controller shows table view controller with 7 US Founders image, name and years of their work.
 When an row is selected then the respective founder details are displayed in other view where the view is transfered from presidentViewController to detailViewController. In detail view controller, the founders image, his title, political party and spouse name.
 The detail view controller also has a info light button. When the button is pressed the view will transfer to the about app navigation controller. This perhaps shows the AboutAppViewController.
 In about app view, it has textView with details about the application, done button which will dismiss the view and a about author button. When about author button is pressed the view will transfer to the aboutAuthorViewController.
 The About Author View have a webView which loads the html content of index.html. This webView displays web page about the author of application.
 */

import UIKit

/*
 PresidentViewController is a subclass of UITableViewController. President View Controller displays the founders data read from the USFounders property list. It also helps user navigate to the detailViewController.
 */
class PresidentViewController: UITableViewController {
    
    //This variable will store Presidents objects
    var foundersObject = [Presidents]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Founction to load the property list data into the table view cell
        readPropertyList()
        
        //Assigning height to the table view cell
        self.tableView.rowHeight = 130

    }
    
    /*
    this function will locate the property list
    and read it into an array then create objects of Presidents class
     */
    func readPropertyList()
    {
        //Getting the path of USFouners.plist
        let path = Bundle.main.path(forResource: "USFounders", ofType: "plist")!
        
        //Reading the property list data and displaying it on console
        let presidentArray:NSArray = NSArray(contentsOfFile: path)!
        print("\(presidentArray)")
        
        //Accessing each item in property list i.e., USFounders.plist
        for item in presidentArray
        {
            //Converting any type into a dictionary type
            let dictionary: [String: String] = (item as! Dictionary)
            
            //Accessing each of the values
            let name = dictionary["Name"]
            let title = dictionary["Title"]
            let years = dictionary["Years"]
            let spouse = dictionary["Spouse"]
            let party = dictionary["Party"]
            let cellImage = dictionary["Image-cell"]
            let image = dictionary["Image"]
            
            //Creating a Presidents object and appending it to foundersObject
            foundersObject.append(Presidents(name: name!, title: title!, years: years!, spouse: spouse!, party: party!, cellImage: cellImage!, image: image!))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
     This function will return the number of sections needed per row
    */
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    /*
    This function will return the number of rows needed in the table view controller
    */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foundersObject.count
    }

    /*
     This function loads data into each table row
     It takes the data in the foundersObject and then load it into the each table view cell
    */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //Retrieving data from foundersObject
        let president:Presidents = foundersObject[indexPath.row]
        
        //Loading the table view cell with identifier "CELL"
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TableViewCell
        
        //Assigning values to the each of objects in cell
        let cellImageName = UIImage(named: president.cellImage)
        cell.cellImageView.image = cellImageName
        cell.cellTitle.text = president.name
        cell.cellSubTitle.text = president.years

        //Returns the cell with content loaded
        return cell
    }
    
    /*
     This function will send the data from the current view to the detail view
     In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // First identify the DetailViewController as the destination view controller
        if (segue.identifier == "DetailView") {
            let destVC = segue.destination as! DetailViewController
            
            // Prepare to send founder image, founder title, founder political party and name of founder's spouse
            // DetailViewController
            if let indexpath = self.tableView.indexPathForSelectedRow {
                
                //Retrieving data from the foundersObject
                let president: Presidents = foundersObject[indexpath.row]
                
                //Sending the data to detail view
                destVC.tvName = president.name
                destVC.tvFounderImage = president.image
                destVC.tvTitle = president.title
                destVC.tvParty = president.party
                destVC.tvSpouse = president.spouse
                
            } // end if
        } // end if
        
    } // end function
}//End of presidentViewController
