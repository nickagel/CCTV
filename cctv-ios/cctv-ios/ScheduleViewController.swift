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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var initialize = self.repository.Initialize()
        Globals.locals = initialize
        print(Globals.locals)
        //print(self.locals.archives)
        
        //var i = 0
        //for j in self.locals.archives {
        //    if i == 3 {
        //        print(j.nid!)
        //    }
        //    i += 1
        //}
        
        //        for j in self.locals.archives {
        //print(j.title!)
        //            self.titleArray.append(j.title!)
        //        }
        
        //        print(self.titleArray)
        
        //var exampleSearch = self.repository.SearchArchives(search:"Burlington")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // as many programs as is in the object
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath) as! ScheduleTableViewCell
        
        cell.startTimeLabel.text = "11:11"
        cell.endTimeLabel.text = "22:22"
        cell.programNameLabel.text = "program"
        
        return cell
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
