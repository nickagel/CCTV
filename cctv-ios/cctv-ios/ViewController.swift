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
        
        //HITTING STREAMING
        
        let streamingEndpoint: String = "http://localhost:3000/initialize"
        guard let urlStreaming = URL(string: streamingEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequestStreaming = URLRequest(url: urlStreaming)
        
        
        NSURLConnection.sendAsynchronousRequest(urlRequestStreaming, queue:OperationQueue.main, completionHandler: {
            (response, data, error) in
            guard let responseData = data else {
                print("Error: did not reveive data")
                return
            }
            guard error == nil else {
                print("error calling GET")
                return
            }
            
            let initialize : NSDictionary
            do {
                initialize =
                    try JSONSerialization.jsonObject(with: responseData, options: .allowFragments)
                    as! NSDictionary
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
            

            for (key,value) in initialize {
                for obj in value as! [AnyObject]{
                    print(obj)
                    print("-----")
                }
            }
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

