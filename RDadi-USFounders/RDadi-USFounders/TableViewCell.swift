//
//  TableViewCell.swift
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
 TableViewCell is a subclass of UITableViewCell. It is a data source for the table view cell in the PresidentViewController in the storyboard. The class will have the IBOutlet of cell for manipulations.
 */
class TableViewCell: UITableViewCell
{
    //IBOutlets for objects in the table view cell
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
