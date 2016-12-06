//
//  ViewController.swift
//  NRConnection
//
//  Created by Naveen Rana on 08/18/2016.
//  Copyright (c) 2016 Naveen Rana. All rights reserved.
//

import UIKit
import NRConnection

class ViewController: UIViewController {
    var arrayDict = [AnyObject]()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //IBActions
    
    @IBAction func getWebServiceButtonClicked(sender: UIButton) {
        BASE_URL = "https://jsonplaceholder.typicode.com/" // change baseurl to your server url

        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        NRConnection.callServiceWithName(.GET, serviceName: "posts", parameters: [:]) { (response, result) in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false

            if response.successful() {
                self.arrayDict = result as! [AnyObject]
                self.tableView.reloadData()
            }
        }
    }
    
    func sendImages() {
        let imagesArray = [UIImage(named: "test1")!,UIImage(named: "test2")!]
        let params = ["userId": "5", "userName": "Naveen Rana"]

        NRConnection.callServiceWithImagesVideosArray(imagesArray: imagesArray, parameters: params, serviceName: "PostImages") { (response, result) in
            if response.successful() {
                print("images post successfully")
            }
        }
    }
    
    func sendVideos() {
        let videosArray = [NSData(contentsOfURL: NSURL(string: "videoUrl")!)!]
        let params = ["userId": "5", "userName": "Naveen Rana"]
        
        NRConnection.callServiceWithImagesVideosArray(videoArray: videosArray, parameters: params, serviceName: "PostImages") { (response, result) in
            if response.successful() {
                print("images post successfully")
            }
        }
    }
    
    func onlyUrl() {
        
        NRConnection.callServiceWithURL(NSURL(string: "https://github.com/naveenrana1309/NRConnection")!) { (response, result) in
            if response.successful() {
                print("url hit successfully")
            }

        }
    }

    //MARK: TableView Delegates
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.arrayDict.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let dict = self.arrayDict[indexPath.row] as! NSDictionary
        cell.textLabel?.text = dict["title"] as? String
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    

}

