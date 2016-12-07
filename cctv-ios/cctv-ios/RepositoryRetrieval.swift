//
//  RepositoryRetrieval.swift
//  cctv-ios
//
//  Created by Nicholas Agel on 12/6/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation
class RepositoryRetrieval{
    func Initialize() -> Locals{
        var locals = Locals()
        var test = true
        let initEndpoint: String = "http://localhost:3000/initialize"
        guard let urlInit = URL(string: initEndpoint) else {
            print("Error: cannot create URL")
            return locals
        }
        
        var urlRequest = URLRequest(url: urlInit)
        urlRequest.httpMethod = "GET"
        let session = URLSession.shared
        
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            
            guard error == nil else {
                print("error calling GET")
                print(error!)
                return
            }
            
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            do {
                guard let initialize = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? NSDictionary else {
                        print("error trying to convert data to JSON")
                        return
                }
            
                locals = Locals(dictionary: initialize)
                test = false
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
    
        task.resume()
        while test{
            
        }
        return locals
    }
    
    func SearchArchives(search:String) -> ArchivesFound{
        var test = true
        var archives = ArchivesFound()

        let initEndpoint: String = "http://localhost:3000/archives"
        guard let urlInit = URL(string: initEndpoint) else {
            print("Error: cannot create URL")
            return archives
        }

        var request = URLRequest(url: urlInit)
        
        let headers = [
            "content-type": "application/json"
        ]
        
        let parameters = ["search": search]
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        }catch{
            print("Error: cannot create JSON")
        }
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            do {
                guard let initialize = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? NSDictionary else {
                        print("error trying to convert data to JSON")
                        return
                }
                
                let locals = ArchivesFound(dictionary: initialize)
                archives = locals
                test = false
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        })
        
        dataTask.resume()
        while test{
            
        }
        return archives
    }
    
}
