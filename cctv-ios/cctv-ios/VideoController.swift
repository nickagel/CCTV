//
//  VideoController.swift
//  cctv-ios
//
//  Created by Nicholas Agel on 12/8/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import Player

class VideoController: UIViewController, PlayerDelegate {
    var videoUrl = ""
    private var player: Player!
    
    //object lifecycle
    
    convenience init() {
        self.init(nibName: nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    // view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.autoresizingMask = ([UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight])
        
        self.player = Player()
        self.player.delegate = self
        self.player.view.frame = self.view.bounds
        
        self.addChildViewController(self.player)
        self.view.addSubview(self.player.view)
        self.player.didMove(toParentViewController: self)
        
        self.player.playbackLoops = true
        
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.player.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let test = URL(string: self.videoUrl)
        self.player.setUrl(test!)
        self.player.playFromBeginning()
    }
    
    // UIGestureRecognizer
    
    func handleTapGestureRecognizer(_ gestureRecognizer: UITapGestureRecognizer) {
        switch (self.player.playbackState.rawValue) {
        case PlaybackState.stopped.rawValue:
            self.player.playFromBeginning()
        case PlaybackState.paused.rawValue:
            self.player.playFromCurrentTime()
        case PlaybackState.playing.rawValue:
            self.player.pause()
        case PlaybackState.failed.rawValue:
            self.player.pause()
        default:
            self.player.pause()
        }
    }
    
    //PlayerDelegate
    
    func playerReady(_ player: Player) {
    }
    
    func playerPlaybackStateDidChange(_ player: Player) {
    }
    
    func playerBufferingStateDidChange(_ player: Player) {
    }
    
    func playerPlaybackWillStartFromBeginning(_ player: Player) {
    }
    
    func playerPlaybackDidEnd(_ player: Player) {
    }
    
    func playerCurrentTimeDidChange(_ player: Player) {
    }
    
    func playerWillComeThroughLoop(_ player: Player) {
        
    }
    
    func setUrl(_ url:String){
        self.videoUrl = url
    }
}
