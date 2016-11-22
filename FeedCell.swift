//
//  FeedCell.swift
//  youtube
//
//  Created by Brian Voong on 7/3/16.
//  Copyright © 2016 letsbuildthatapp. All rights reserved.
//

import UIKit

class FeedCell: BaseCell {
    
    var tutorial_link:Tutorial_Obj?{
        didSet{
            self.link = tutorial_link?.Tutorial_url
            self.t_name = tutorial_link?.TutorialName
            print("------------")
            print(self.link!)
            print(self.t_name!)
            
            if let name = self.t_name {
                self.tutorialName.text = name
            }
        }
    }
    var link:String?
    var t_name:String?
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
    
    let tutorialName: UILabel = {
        let t = UILabel()
        //================
        t.backgroundColor = Colors.TopBar
        t.text = "Vocabulary 1"
        t.textColor = Colors.BodyTextColor
        //===============
        t.textAlignment = .Center
        return t
    }()
    
    
    override func setupViews() {
        
        backgroundColor = .whiteColor()
        
        
        
        addSubview(tutorialName)
        addConstraintsWithFormat("H:|[v0]|", views: tutorialName)
        addConstraintsWithFormat("V:|-5-[v0]|", views: tutorialName)
        
        
        /*backgroundColor = UIColor(white: 0, alpha: 0.1)
         
         let width = frame.width
         let height = frame.height
         let youtubeurl:String = self.link!
         VideoView.loadHTMLString("<iframe width=\"\(width)\" height=\"\(height)\" src=\"\(youtubeurl)?&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
         addSubview(VideoView)
         
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












