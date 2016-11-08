//
//  ViewController.swift
//  cctv-ios
//
//  Created by Student on 11/8/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let archivesEndpoint: String = "localhost:3000/archives"
        guard let url = NSURL(string: archivesEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequest = NSURLRequest(URL: url)
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        let task = session.dataTaskWithRequest(urlRequest) { (data, response, error) in
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            guard error == nil else {
                print("error calling GET on /archives")
                print(error)
                return
                
                
            }
            
            // parse the result as JSON, since that's what the API provides
            /* do {
            guard let archives = try NSJSONSerialization.JSONObjectWithData(responseData, options: []) as? [String: AnyObject] else {
            // archives: handle
            print("Couldn't convert received data to JSON dictionary")
            return
            }
            // now we have the todo, let's just print it to prove we can access it
            print("The archives is: " + archives.description)
            
            // the todo object is a dictionary
            // so we just access the title using the "title" key
            // so check for a title and print it if we have one
            guard let archivesTitle = archives["title"] as? String else {
            print("Could not get todo title from JSON")
            return
            }
            print("The title is: " + archivesTitle)
            } catch  {
            print("error trying to convert data to JSON")
            }
            
            */
            
        }
        
        task.resume()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
