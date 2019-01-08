//
//  Presidents.swift
//  RDadi-USFounders
//
//  Created by Revanth Reddy Dadi on 03/10/18.
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
 Presidents class is a sub class of NSObject. It has instance variables and init method to initialize values during class object creation. This class helps to hold the data from the property list.
 */
class Presidents: NSObject
{
    //Instance variables
    var name: String!
    var title: String!
    var years: String!
    var spouse: String!
    var party: String!
    var cellImage: String!
    var image: String!
    
    //Initializing the instance variables
    init(name: String, title: String, years: String, spouse: String, party: String, cellImage: String, image: String)
    {
        self.name = name;
        self.title = title;
        self.years = years;
        self.spouse = spouse;
        self.party = party;
        self.cellImage = cellImage;
        self.image = image;
    }

}//End of Presidents class
