//
//  Video.swift
//  youtube
//
//  Created by Brian Voong on 6/9/16.
//  Copyright © 2016 letsbuildthatapp. All rights reserved.
//

import UIKit

class Videodata: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var views: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
    
}

class Channel: NSObject {
    var subjectname: String?
    var logo: String?
}