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
    
    var titles = ["title1","title2","title3"]
    var subtitles = ["sub1","sub2","sub3"]
    var images = [UIImage(named:"Video Thumb Placeholder"),UIImage(named:"Video Thumb Placeholder"),UIImage(named:"Video Thumb Placeholder")]
    var times = ["00:00","00:01","00:02"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var initialize = self.repository.Initialize()
        self.locals = initialize
        print(self.locals)
        
        //var exampleSearch = self.repository.SearchArchives(search:"Burlington")
    
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
