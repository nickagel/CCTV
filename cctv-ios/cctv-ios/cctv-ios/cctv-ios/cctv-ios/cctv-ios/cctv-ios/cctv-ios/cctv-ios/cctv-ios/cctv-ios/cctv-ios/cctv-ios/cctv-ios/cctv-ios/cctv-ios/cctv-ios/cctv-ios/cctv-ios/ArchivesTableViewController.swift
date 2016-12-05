//
//  ArchivesTableViewController.swift
//  cctv-ios
//
//  Created by Lily H. Nguyen  on 12/4/16.
//  Copyright © 2016 Student. All rights reserved.
//


// THIS IS ALL GARBO I DIDN'T CREATE A TABLE VIEW CONTROLLER
// I WROTE A TABLE VITE INSIDE OF A NORMAL VIEW CONTROLLER
// DON'T DO TABLE VIEW CONTROLLERS FML APPLE YOU SUCK

import UIKit

class ArchivesTableViewController: UITableViewController {
    
    //MARK: Properties
    var programs = [Program]()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Load Sample Data
        loadPrograms()
    }
    
    func loadPrograms() {
        let photo1 = UIImage(named: "Video Thumb Placeholder")!
        
        let program1 = Program(title: "Title 1", subtitle: "Sub 1", photo: photo1, time: "00:00")!
        let program2 = Program(title: "Title 2", subtitle: "Sub 2", photo: photo1, time: "00:01")!
        
        programs += [program1, program2]
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ArchivesTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ArchivesTableViewCell
        
        let program = programs[indexPath.row]
        
        cell.videoLabel.text = program.title
        cell.videoSubLabel.text = program.subtitle
        cell.thumbnailImageView.image = program.photo
        cell.timeLabel.text = program.time
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
