//
//  uri.swift
//  cctv-ios
//
//  Created by Nicholas Agel on 12/4/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation
class Uri {
    private var channel: String?
    private var uri: String?

    init(channel:String , uri:String ){
        self.channel = channel
        self.uri     = uri
    }
    
    func getChannel() -> String?{
        return self.channel
    }
    func getUri() -> String?{
        return self.uri
    }
}
