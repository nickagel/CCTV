//  ViewController.swift
//  cctv-ios
//
//  Created by Student on 11/13/16.
//  Copyright © 2016 Student. All rights reserved.

/*
 * VIEW CONTROLLER
 * Connected to "View Controller" & "Archives" view in storyboard
 * displays *10* most recent archive items
 * searches through past archives and returns *10* most recent items
 * on cell tap, plays video using NID
 */

import UIKit
import EVReflection
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    let repository = RepositoryRetrieval()
    
    @IBOutlet weak var tableArchiveView: UITableView!
//    @IBOutlet weak var archiveSearch: UISearchBar!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var nidVar = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        archiveSearch.delegate = self
        
        self.repository.Initialize(){
            (locals, error) in
            Globals.locals = locals
        }
        //print(Globals.locals)
        //print(Globals.locals.archives)
        
//        self.repository.SearchArchives(search:"Burlington"){
//            (archives, error) in
//            print(archives)
//        }
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10 // determines the number of rows rendered at a time.
        
    } // end numberOfRowsInSection
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "archiveCell", for: indexPath) as! ArchiveTableViewCell
        
        // This is the video icon -- if implemented, need to resize the container in main storyboard
        //cell.thumbView.image = UIImage(named:"Video Thumb Placeholder")

        //print(Globals.locals.archives)
        var i = 0
        if Globals.locals.archives == nil {
            print("ERROR: No 'archives' object to populate table cells")
        } else {
            for item in Globals.locals.archives {
                if i == indexPath.row {
                    cell.titleLabel.text = item.title!
                    cell.subtitleLabel.text = item.subtitle! // some of these are empty strings
                    
                    let index = item.airDate!.index(item.airDate!.startIndex, offsetBy: 10)
                    let substring = item.airDate!.substring(to: index)
                    cell.timeLabel.text = substring // timeLabel is a deceptive label but oh well
                    
                    self.nidVar = item.nid! // use this to render the video
                }
                i += 1
            }
        }
        print(self.nidVar)
        return cell
        
    } // end cellForRowAt
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var i = 0
        if Globals.locals.archives == nil {
            print("ERROR: No 'archives' object to populate table cells")
        } else {
            for item in Globals.locals.archives {
                if i == indexPath.row {
                    print(item.nid!) // comment this mf
                    performSegue(withIdentifier: "VideoShowSegue", sender: "https://v.cdn.vine.co/r/videos/AA3C120C521177175800441692160_38f2cbd1ffb.1.5.13763579289575020226.mp4")
                }
                i += 1
            }
        }
        
    } // end didSelectRowAt
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier=="VideoShowSegue"{
            let s = segue.destination as! VideoController
            s.setUrl(sender as! String)
        }
        
    } // end prepare
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchText:", searchBar.text!)
    } // end searchBarSearchButtonClicked
    
} // end class
