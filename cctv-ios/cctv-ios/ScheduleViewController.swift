//
//  ScheduleViewController.swift
//  cctv-ios
//
//  Created by Lily H. Nguyen  on 12/7/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let repository = RepositoryRetrieval()
    var locals = Locals()

    @IBOutlet weak var tableSchedulesView: UITableView!
    @IBOutlet weak var channelController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // default selected segment is channel 17 - 0
        self.channelController.selectedSegmentIndex = 0
        
        var initialize = self.repository.Initialize()
        Globals.locals = initialize
//        print(Globals.locals)
//        print(Globals.locals.schedules)
        
        //var exampleSearch = self.repository.SearchArchives(search:"Burlington")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ACTION
    // 0 is channel 17
    // 1 is channel 317
    @IBAction func ChangeChannel(_ sender: Any) {
        if channelController.selectedSegmentIndex == 0 {
//            print("channel 17")
            self.channelController.selectedSegmentIndex = 0 // getting fat errors, hacky workaround
            tableSchedulesView.reloadData()
        } else if channelController.selectedSegmentIndex == 1 {
//            print("channel 317")
            self.channelController.selectedSegmentIndex = 1 // getting fat errors, hacky workaround
            tableSchedulesView.reloadData()
        }
    }
    
    // END ACTION
    
    
    // these two functions get recalled on .reloadData()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24 // as many programs as is in the object
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath) as! ScheduleTableViewCell
        
        
        var k = 0
        if channelController.selectedSegmentIndex == 0 {
            print("channel17")
            for i in Globals.locals.schedules {
                for j in i.channel17 {
                    if k == indexPath.row {
                        cell.startTimeLabel.text = j.startTime!
                        cell.endTimeLabel.text = j.endTime!
                        cell.programNameLabel.text = j.title!
                    }
                    k += 1
                }
            }
        } else if channelController.selectedSegmentIndex == 1 {
            print("channel317")
            for i in Globals.locals.schedules {
                for j in i.channel317 {
                    if k == indexPath.row {
                        cell.startTimeLabel.text = j.startTime!
                        cell.endTimeLabel.text = j.endTime!
                        cell.programNameLabel.text = j.title!
                    }
                    k += 1
                }
            }
        }
        
//        for i in Globals.locals.schedules {
//            
//            if channelController.selectedSegmentIndex == 0 {
//                
//            } else if channelController.selectedSegmentIndex == 1 {
//                
//            }
//            
//        }

        
//        var i = 0
//        if Globals.locals.schedules == nil {
//            print("fuck")
//        } else {
//            for item in Globals.locals.schedules {
//                if i == indexPath.row {
//                    
//                }
//                i += 1
//            }
//        }
        
//        cell.startTimeLabel.text = "11:11"
//        cell.endTimeLabel.text = "22:22"
//        cell.programNameLabel.text = "program"
        
        
        return cell
    }
}
