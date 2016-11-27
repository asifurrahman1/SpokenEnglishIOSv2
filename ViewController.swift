//
//  ViewController.swift
//  SBLoader
//
//  Created by Satraj Bambra on 2015-03-16.
//  Copyright (c) 2015 Satraj Bambra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HolderViewDelegate {
    
    var holderView = HolderView(frame: CGRectZero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = Colors.TopBar// UIColor.blueColor()
        addHolderView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addHolderView() {
        let boxSize: CGFloat = 100.0
        holderView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
                                  y: view.bounds.height / 2 - boxSize / 2,
                                  width: boxSize,
                                  height: boxSize)
        holderView.parentFrame = view.frame
        holderView.delegate = self
        view.addSubview(holderView)
        holderView.addOval()
        //let timer = NSTimer.scheduledTimerWithTimeInterval(
        //    5.5, target: self, selector: Selector("show"), userInfo: nil, //repeats: false
        // )
    }
    
    var window: UIWindow?
    
    func show() {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.makeKeyAndVisible()
        
        
        
        let layout = UICollectionViewFlowLayout()
        //        layout.scrollDirection = .Horizontal
        window?.rootViewController = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout))
        //########## after splash view calling main view ############
        
    }
    
    
    func animateLabel() {
        holderView.removeFromSuperview()
        view.backgroundColor = Colors.TopBar//UIColor.blueColor()
        
        // 2
        var label: UILabel = UILabel(frame: view.frame)
        label.textColor = UIColor.blackColor()
        label.font = UIFont(name: "HelveticaNeue-Thin", size:40.0)
        label.textAlignment = NSTextAlignment.Center
        label.text = "Spoken English"
        label.transform = CGAffineTransformScale(label.transform, 0.25, 0.25)
        view.addSubview(label)
        
        // 3
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseInOut,
                                   animations: ({
                                    label.transform = CGAffineTransformScale(label.transform, 4.0, 4.0)
                                   
                                   }), completion: { finished in
                                    self.show()
        })
    }
    
    
}

