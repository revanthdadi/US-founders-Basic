//
//  AboutAuthorViewController.swift
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
import WebKit

/*
 AboutAuthorViewController is a subclass of UIViewController. It is a data source for the about author view. This view loads a web page of the author in a webView object. When a button in about app view is pressed then the controller transfers to this view.
 */
class AboutAuthorViewController: UIViewController {

    //IBOutlet for the webView
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the title of the view
        navigationItem.title = "About Author"

        //Create a path to fetch the content/data of the index.html file as part of your project app bundle
        let path = Bundle.main.path(forResource: "index", ofType: "html")!
        
        //Retrieve the data from the given path
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        //Encode the data and load it in html
        let html = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        
        //Load the data into the IBOutlet called myWebView
        myWebView.loadHTMLString(html! as String, baseURL: Bundle.main.bundleURL)
    }//End of viewDidLoad

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}//End of AboutAuthorViewController
