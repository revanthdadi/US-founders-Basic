//
//  AboutAppViewController.swift
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
 AboutAppViewController is a subclass of UIViewController. It is a data source for the about app view. It has text view and a button. when button is pressed the view will transfer to the about author view. When a info light button in a detail view is pressed then the view transfers to the present view. When a done button is pressed then view will dismiss.
 */
class AboutAppViewController: UIViewController
{
    //IBAction for the About Author button
    @IBAction func aboutAuthorButton(_ sender: UIButton) {
        
        //Get the main storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //find the controller with the identifier "AboutAuthorViewController"
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "AboutAuthorViewController") as! AboutAuthorViewController
        
        //Transfer the controller to the identified controller in destinationVC
        self.navigationController?.pushViewController(destinationVC, animated: false)
    }//End of aboutAuthorButton
    
    //IBAction for the Done button placed on the right side of navigation
    @IBAction func doneBarButton(_ sender: UIBarButtonItem)
    {
        //Dismiss the view when button is pressed
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
