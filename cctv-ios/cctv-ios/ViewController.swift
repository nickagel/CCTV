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
import AVKit
import AVFoundation
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    let repository = RepositoryRetrieval()
    
    @IBOutlet weak var tableArchiveView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let avPlayerController = AVPlayerViewController()
    var avPlayer: AVPlayer?
    
    var nidVar = String()
    var searchText = String()
    var mode = Double()
    
//    var array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // start with not search mode
        // 0 = not search mode
        // 1 = search mode
        self.mode = 0
        
        self.repository.Initialize(){
            (locals, error) in
            Globals.locals = locals
        }
        //print(Globals.locals)
        //print(Globals.locals.archives)
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var i = Int()
        
        if mode == 0 {
            
            i = 10
            
        } else if mode == 1 {
    
//            self.repository.SearchArchives(search: searchText){
//                (archives, error) in
//                return archives.archives.count
//            }
            i = 3
        }
        
        return i // determines the number of rows rendered at a time.
        
    } // end numberOfRowsInSection
    
    // gets recalled on .readloadData()
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "archiveCell", for: indexPath) as! ArchiveTableViewCell
        
        // This is the video icon -- if implemented, need to resize the container in main storyboard
        //cell.thumbView.image = UIImage(named:"Video Thumb Placeholder")

        //print(Globals.locals.archives)
        
        var i = 0
        
        if mode == 0 {
            //            print("not searching")
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
                        
                        self.nidVar = item.url! // use this to render the video
                    }
                    i += 1
                }
            }
        } else if mode == 1 {
            self.repository.SearchArchives(search: searchText){
                (archives, error) in
                for item in archives.archives {
                    if i == indexPath.row {
                        cell.titleLabel.text = item.title!
                        cell.subtitleLabel.text = item.subtitle! // some of these are empty strings
                        
                        let index = item.airDate!.index(item.airDate!.startIndex, offsetBy: 10)
                        let substring = item.airDate!.substring(to: index)
                        cell.timeLabel.text = substring // timeLabel is a deceptive label but oh well
                        
                        self.nidVar = item.url! // use this to render the video
                    
                    }
                    i += 1
                }
            }
        }
        // on search, the cell updates are slow
        return cell
        
    } // end cellForRowAt
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var i = 0
        if Globals.locals.archives == nil {
            print("ERROR: No 'archives' object to populate table cells")
        } else {
            for item in Globals.locals.archives {
                if i == indexPath.row {
                    print(item.url!) // why the fuck isn't this updating on search - all the cell videos are sTATIC??!?3 KLJWLFAJS
                    
                    let videoURL = URL(string:item.url!)
                    
                    if let urlVar = videoURL {
                        self.avPlayer = AVPlayer(url: urlVar)
                        self.avPlayerController.player = self.avPlayer
                    }
                    
                    self.present(self.avPlayerController, animated: true) { ()
                        -> Void in self.avPlayerController.player?.play()
                    }
                    
                }
                i += 1
            }
        }
        
    } // end didSelectRowAt
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchText = searchBar.text!
        
        self.mode = 1
        
        tableArchiveView.reloadData()
        
    } // end searchBarSearchButtonClicked
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.text = ""
        
        self.mode = 0
        
        tableArchiveView.reloadData()
        
    }// end searchBarCancelButtonClicked
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Channel 17") {
            let VC2 : StreamViewController = segue.destination as! StreamViewController
            VC2.receivedChannel = 0
            
        }
        if (segue.identifier == "Channel 317") {
            let VC2 : StreamViewController = segue.destination as! StreamViewController
            VC2.receivedChannel = 1
        }
    }
    
} // end class
