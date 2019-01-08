//
//  DetailViewController.swift
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
 DetailViewController is a subclass of UIViewCOntroller. It is also a data source for detail view. This view holds specific data related to the specific founder. When a founder row is pressed in president view controller then it will transfer to this view.
 */
class DetailViewController: UIViewController
{
    //IBOutlet for label in the stackView of the detail view controller
    @IBOutlet weak var dtvImage: UIImageView!
    @IBOutlet weak var dtvTitle: UILabel!
    @IBOutlet weak var dtvParty: UILabel!
    @IBOutlet weak var dtvSpouse: UILabel!
    
    //IBAction for the info light button
    //When the button is pressed then control will be transfered to the AboutAppViewController
    @IBAction func aboutAppButton(_ sender: UIButton)
    {
        //Creating optional value for storyboard connection
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Finding the navigation controller named as "AboutAppNavigationController"
        let controller = storyboard.instantiateViewController(withIdentifier: "AboutAppNavigationController") as! UINavigationController
        
        //Transfering view to the controller
        self.present(controller, animated: false, completion: nil)
    }
    // Variables to heold data passed from the TableViewController
    var tvName: String!         //Name of founder
    var tvFounderImage:String! // founder image
    var tvTitle:String!     // Title of the founder
    var tvParty:String!     // party of the founder
    var tvSpouse:String!      // Founder spouse name
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the name of president at navigation bar
        navigationItem.title = tvName;
        
        // Place sent data into their outlets
        dtvImage.image = UIImage(named: tvFounderImage)
        dtvTitle.text = tvTitle
        dtvParty.text = tvParty
        dtvSpouse.text = tvSpouse
    }

}
