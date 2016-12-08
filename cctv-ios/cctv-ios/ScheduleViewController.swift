//  ScheduleViewController.swift
//  cctv-ios
//
//  Created by Lily H. Nguyen  on 12/7/16.
//  Copyright © 2016 Student. All rights reserved.

/*
 * SCHEDULE VIEW CONTROLLER
 * Connected to "Schedule" view in storyboard
 * displays schedule
 * toggle channel for different schedules
 */
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let repository = RepositoryRetrieval()

    @IBOutlet weak var tableSchedulesView: UITableView!
    @IBOutlet weak var channelController: UISegmentedControl!
    @IBOutlet weak var currentDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // default selected segment is channel 17 - 0
        self.channelController.selectedSegmentIndex = 0
        
        self.repository.Initialize(){
            (locals, error) in
            Globals.locals = locals
        }
        //print(Globals.locals)
        //print(Globals.locals.schedules)
        
        for i in Globals.locals.schedules {
            self.currentDateLabel.text = i.date!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Segmented Control
    @IBAction func ChangeChannel(_ sender: Any) {
        if channelController.selectedSegmentIndex == 0 {
            //print("channel 17")
            self.channelController.selectedSegmentIndex = 0 // getting fat errors, hacky workaround
            tableSchedulesView.reloadData()
        } else if channelController.selectedSegmentIndex == 1 {
            //print("channel 317")
            self.channelController.selectedSegmentIndex = 1 // getting fat errors, hacky workaround
            tableSchedulesView.reloadData()
        }
    } // end action on Segmented Control
    
    // get recalled on .reloadData()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24 // as many programs as is in the object
    }
    
    // get recalled on .reloadData()
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath) as! ScheduleTableViewCell
        
        // ugly, could be simplified (outer for loop with conditions for seg contr on inside)
        var k = 0
        if Globals.locals.schedules == nil {
            print("ERROR: No 'schedules' object to populate table cells")
        } else {
            if channelController.selectedSegmentIndex == 0 {
                //print("channel17")
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
                //print("channel317")
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
        } // end else
        
        return cell
    }
}
