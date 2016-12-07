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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var initialize = self.repository.Initialize()
        Globals.locals = initialize
//        print(Globals.locals)
//        print(Globals.locals.archives)
        
        
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
        
        cell.thumbView.image = UIImage(named:"Video Thumb Placeholder")
        
        // loop through to access the "indexPath"th item
        print(Globals.locals.archives)
        var i = 0
        if Globals.locals.archives == nil {
            print("fuck")
        } else {
            for item in Globals.locals.archives {
                if i == indexPath.row {
//                    print(item.title!) // set the shit here
                    cell.titleLabel.text = item.title!
                    cell.subtitleLabel.text = item.subtitle! // some of these are empty strings
                    cell.timeLabel.text = item.airDate! // parse this to look nice, timeLabel is a deceptive label but oh well
                }
                i += 1
            }
        }
        
        
        //        print(titleArray[indexPath.row+1])
        //        cell.titleLabel.text = titleArray[indexPath.row]
            
        return cell
    }

}
