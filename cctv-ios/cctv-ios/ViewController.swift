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
    
    let repository = RepositoryRetrieval()
    var locals = Locals()
    // 
    @IBOutlet weak var tableArchiveView: UITableView!
    @IBOutlet weak var tableScheduleView: UITableView!
    
//    var titleArray = [String]()
    
//     Test data for Archives
    var titles = ["title1","title2","title3"]
    var subtitles = ["sub1","sub2","sub3"]
    var images = [UIImage(named:"Video Thumb Placeholder"),UIImage(named:"Video Thumb Placeholder"),UIImage(named:"Video Thumb Placeholder")]
    var times = ["00:00","00:01","00:02"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var initialize = self.repository.Initialize()
        self.locals = initialize
        print(self.locals)
        //print(self.locals.archives)
        
        //var i = 0
        //for j in self.locals.archives {
        //    if i == 3 {
        //        print(j.nid!)
        //    }
        //    i += 1
        //}
        
        for j in self.locals.archives {
            //print(j.title!)
//            self.titleArray.append(j.title!)
        }
        
//        print(self.titleArray)
        
        //var exampleSearch = self.repository.SearchArchives(search:"Burlington")
    
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "archiveCell", for: indexPath) as! ArchiveTableViewCell

        cell.thumbView.image = images[indexPath.row]
        cell.titleLabel.text = titles[indexPath.row]
        cell.subtitleLabel.text = subtitles[indexPath.row]
        cell.timeLabel.text = times[indexPath.row]
        
//        cell.thumbView.image = UIImage(named:"Video Thumb Placeholder")
        
        // loop through to access the "indexPath"th item in self.locals.archives
        //        print(self.locals.archives)
        
        //        var i = 0
        //        if self.locals.archives == nil {
        //            print("fuck")
        //        } else {
        //            for item in self.locals.archives {
        //                if i == 3 { //indexPath.row
        //                    print(item.nid!) // set the shit here
        //                }
        //                i += 1
        //            }
        //        }
        
        
//        for j in self.locals.archives {
//            print(j.nid!)
//        }
        
        //        print(titleArray[indexPath.row+1])
        //        cell.titleLabel.text = titleArray[indexPath.row]
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath) as! ScheduleTableViewCell
        
        cell.thumbView.image =
        
        return cell
    }

}
