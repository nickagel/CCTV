//  Program.swift
//  cctv-ios
//
//  Created by Lily H. Nguyen  on 12/4/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit // Foundation

class ProgramItem {
    
    // MARK: Properties
    // make these lets?
    var title: String
    var subtitle: String
    var photo: UIImage?
    var time: String
    
    // MARK: Initialization
    
    init?(title: String, subtitle: String, photo: UIImage?, time: String) {
        
        self.title = title
        self.subtitle = subtitle
        self.photo = photo
        self.time = time
        
        if title.isEmpty || subtitle.isEmpty || time.isEmpty {
            return nil
        }
    }
}
