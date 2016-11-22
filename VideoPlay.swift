//
//  VideoPlay.swift
//  Learning_App_test2
//
//  Created by Md Asifur Rahman on 9/10/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//

import UIKit

class VideoPlay: UIViewController {
    
    var link:String?
    let videoLauncher = VideoLauncher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoLauncher.showVideoPlayer(self.view,url: link!)
        
        
    }
    
    override func willMoveToParentViewController(parent: UIViewController?) {
        if parent == nil {
            //EDITED LAST==========
            self.videoLauncher.videoplayer.stopVideo()
            print("Left player")
        }
    }
}
