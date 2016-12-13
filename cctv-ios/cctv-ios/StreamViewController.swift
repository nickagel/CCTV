//
//  StreamViewController.swift
//  
//
//  Created by Lily H. Nguyen  on 12/9/16.
//
//

import UIKit
import AVKit
import AVFoundation

class StreamViewController: UIViewController {
    
    @IBOutlet weak var channelLabel: UILabel!
    
    var receivedChannel = Int()
    
    let avPlayerController = AVPlayerViewController()
    var avPlayer: AVPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var videoURL = URL(string:"")
        
        if self.receivedChannel == 0 {
            //print("17")
            self.channelLabel.text = "Channel 17"
            videoURL = URL(string:"https://stream4.cctv.org:443/live/_definst_/mp4:cctv17.stream/playlist.m3u8")
        } else if self.receivedChannel == 1 {
            //print("317")
            self.channelLabel.text = "Channel 317"
            videoURL = URL(string:"https://stream4.cctv.org:443/live/_definst_/mp4:cctv317.stream/playlist.m3u8")
        } else {
            videoURL = URL(string:"https://stream4.cctv.org:443/live/_definst_/mp4:cctv317.stream/playlist.m3u8")
        }
        
        if let urlVar = videoURL {
            self.avPlayer = AVPlayer(url: urlVar)
            self.avPlayerController.player = self.avPlayer
        }
        
        self.present(self.avPlayerController, animated: true) { ()
            -> Void in self.avPlayerController.player?.play()
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
