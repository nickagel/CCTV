//
//  ViewController.swift
//  cctv-ios
//
//  Created by Student on 11/13/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import EVReflection
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var locals = Locals()
    // 
    @IBOutlet weak var tableArchiveView: UITableView!
    
    var titles = ["title1","title2","title3"]
    var subtitles = ["sub1","sub2","sub3"]
    var images = [UIImage(named:"Video Thumb Placeholder"),UIImage(named:"Video Thumb Placeholder"),UIImage(named:"Video Thumb Placeholder")]
    var times = ["00:00","00:01","00:02"]
    
    // for ach
    //    var archiveArray = [ProgramItem]()
    //    var filteredArchiveArray = [ProgramItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //HITTING STREAMING
        let streamingEndpoint: String = "http://localhost:3000/streaming"
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
            
            let initUris : NSDictionary
            do {
                initUris =
                    try JSONSerialization.jsonObject(with: responseData, options: .allowFragments)
                    as! NSDictionary
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
            
            let uris = Uris(dictionary: initUris)
            self.locals.uris = uris.uris
            
        })
        
        //hit archives
        let archivesEndpoint: String = "http://localhost:3000/archives"
        guard let urlArchives = URL(string: archivesEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequestArchives = URLRequest(url: urlArchives)
        
        
        NSURLConnection.sendAsynchronousRequest(urlRequestArchives, queue:OperationQueue.main, completionHandler: {
            (response, data, error) in
            guard let responseData = data else {
                print("Error: did not reveive data")
                return
            }
            guard error == nil else {
                print("error calling GET")
                return
            }
            
            let initArchives : NSDictionary
            do {
                initArchives =
                    try JSONSerialization.jsonObject(with: responseData, options: .allowFragments)
                    as! NSDictionary
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
            
            let archives = Archives(dictionary: initArchives)
            self.locals.archives = archives.archives
            print(self.locals.archives)
            
        })
        
        //hit schedules
        let schedulesEndpoint: String = "http://localhost:3000/schedules"
        guard let urlSchedules = URL(string: schedulesEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequestSchedules = URLRequest(url: urlSchedules)
        
        
        NSURLConnection.sendAsynchronousRequest(urlRequestSchedules, queue:OperationQueue.main, completionHandler: {
            (response, data, error) in
            guard let responseData = data else {
                print("Error: did not reveive data")
                return
            }
            guard error == nil else {
                print("error calling GET")
                return
            }
            
            let initSchedules : NSDictionary
            do {
                initSchedules =
                    try JSONSerialization.jsonObject(with: responseData, options: .allowFragments)
                    as! NSDictionary
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
            
            let schedules = Scheduling(dictionary: initSchedules)
            self.locals.schedules = schedules.schedules
            
        })
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        return 1
    //    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArchiveTableViewCell

        cell.thumbView.image = images[indexPath.row]
        cell.titleLabel.text = titles[indexPath.row]
        cell.subtitleLabel.text = subtitles[indexPath.row]
        cell.timeLabel.text = times[indexPath.row]
            
        return cell
    }

}

class Uri: EVObject{
    var channel: String?
    var uri: String?
}

class Uris: EVObject{
    var uris: [Uri]!
}

class Archive: EVObject{
    var nid: String?
    var title: String?
    var subtitle: String?
    var airDate: String?
}

class Archives: EVObject{
    var archives: [Archive]!
}

class Schedule: EVObject{
    var ch_type: String?
    var endTime: String?
    var startTime: String?
    var title: String?
}

class Schedules: EVObject{
    var date: String?
    var channel17: [Schedule]!
    var channel317:[Schedule]!
}

class Scheduling: EVObject{
    var schedules: [Schedules]!
}

class Locals{
    var schedules: [Schedules]!
    var uris: [Uri]!
    var archives: [Archive]!
}
