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
        
        //hit initialize
        let initEndpoint: String = "http://localhost:3000/initialize"
        guard let urlInit = URL(string: initEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequestInit = URLRequest(url: urlInit)
        
        NSURLConnection.sendAsynchronousRequest(urlRequestInit, queue:OperationQueue.main, completionHandler: {
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
            
            let appData = Locals(dictionary: initialize)
            self.locals = appData
            print(self.locals)
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
