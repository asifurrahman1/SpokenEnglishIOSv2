//
//  TutorialVideoCell.swift
//  Learning_App_test2
//
//  Created by Md Asifur Rahman on 9/10/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//



//########################### NO NEED ###################
import UIKit
class TutorialVideoCell: BaseCell {
    
    
    var tutorial_link:String?{
        didSet{
            self.link = tutorial_link!
            print("------------")
            print(self.link)
        }
    }
    var link = String()
    
    /*
     let linkview:WKWebView = {
     let lv = WKWebView()
     return lv
     }()
     */
    let VideoView : UIWebView = {
        let vp = UIWebView()
        vp.allowsInlineMediaPlayback = true
        return vp
    }()
    
    
    override func setupViews() {
        backgroundColor = UIColor(white: 0, alpha: 0.1)
        let width = frame.width
        let height = frame.height
        let youtubeurl:String = link
        VideoView.loadHTMLString("<iframe width=\"\(width)\" height=\"\(height)\" src=\"\(youtubeurl)?&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        addSubview(VideoView)
        /*
         addSubview(linkview)
         addConstraintsWithFormat("H:|-5-[v0]-5-|", views: linkview)
         addConstraintsWithFormat("V:|-5-[v0]-5-|", views: linkview)
         
         if let url = NSURL(string: link){
         print("NSURLL")
         print(url)
         let request = NSURLRequest(URL: url)
         
         linkview.loadRequest(request)
         
         }
         */
        
    }
    
    
}
