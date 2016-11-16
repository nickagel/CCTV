//
//  ViewController.swift
//  cctv-ios
//
//  Created by Student on 11/13/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //HITTING THE ARCHIVES
        let archivesEndpoint: String = "http://localhost:3000/archives"
        guard let urlArchives = NSURL(string: archivesEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequestArchives = NSURLRequest(URL: urlArchives)
        
        
        NSURLConnection.sendAsynchronousRequest(urlRequestArchives, queue:NSOperationQueue.mainQueue(), completionHandler: {
            (response, data, error) in
            guard let responseData = data else {
                print("Error: did not reveive data")
                return
            }
            guard error == nil else {
                print("error calling GET")
                print(error)
                return
            }
            
            /* let jo : NSDictionary
            do {
            jo =
            try NSJSONSerialization.JSONObjectWithData(responseData, options: [])
            as! NSDictionary
            } catch  {
            print("error trying to convert data to JSON")
            return
            }
            
            if let cval = jo["context"]
            {
            self.restContext.text = String(cval)
            }
            
            */
            
            
        })
        
        
        
        //HITTING SCHEDULES
        let schedulesEndpoint: String = "http://localhost:3000/schedules"
        guard let urlSchedules = NSURL(string: schedulesEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequestSchedules = NSURLRequest(URL: urlSchedules)
        
        
        NSURLConnection.sendAsynchronousRequest(urlRequestSchedules, queue:NSOperationQueue.mainQueue(), completionHandler: {
            (response, data, error) in
            guard let responseData = data else {
                print("Error: did not reveive data")
                return
            }
            guard error == nil else {
                print("error calling GET")
                print(error)
                return
            }
            
            /*
            let jo : NSDictionary
            do {
            jo =
            try NSJSONSerialization.JSONObjectWithData(responseData, options: [])
            as! NSDictionary
            } catch  {
            print("error trying to convert data to JSON")
            return
            }
            
            if let cval = jo["context"]
            {
            self.restContext.text = String(cval)
            }
            
            
            */
            
            
        })
        
        //HITTING STREAMING
        
        let streamingEndpoint: String = "http://localhost:3000/streaming"
        guard let urlStreaming = NSURL(string: streamingEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequestStreaming = NSURLRequest(URL: urlStreaming)
        
        
        NSURLConnection.sendAsynchronousRequest(urlRequestStreaming, queue:NSOperationQueue.mainQueue(), completionHandler: {
            (response, data, error) in
            guard let responseData = data else {
                print("Error: did not reveive data")
                return
            }
            guard error == nil else {
                print("error calling GET")
                print(error)
                return
            }
            
            /*
            let jo : NSDictionary
            do {
            jo =
            try NSJSONSerialization.JSONObjectWithData(responseData, options: [])
            as! NSDictionary
            } catch  {
            print("error trying to convert data to JSON")
            return
            }
            
            if let cval = jo["context"]
            {
            self.restContext.text = String(cval)
            }
            
            
            */
            
            
            
            
            
            
        })
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

