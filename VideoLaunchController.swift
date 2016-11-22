//
//  VideoLaunchController.swift
//  Learning_App_test2
//
//  Created by Md Asifur Rahman on 9/9/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//

import UIKit

class VideoLaunchController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    var Tutorials: PerDay?{
        didSet {
            self.TutorialURL = Tutorials!.Days_tutorials!
            print( self.TutorialURL)
        }
    }
    
    var TutorialURL = [Tutorial_Obj]()
    
    let cellId = "cellId"
    
    
    lazy var collectionview:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //#############################################
        cv.backgroundColor = UIColor.whiteColor()
        //#############################################
        cv.dataSource = self
        cv.delegate = self
        cv.registerClass(FeedCell.self, forCellWithReuseIdentifier: "cellId")
        
        return cv
    }()
    
    /* let Subject: UILabel = {
     let word = UILabel()
     word.translatesAutoresizingMaskIntoConstraints = false
     word.text = "Subject Title"
     
     //#############################################
     word.backgroundColor = UIColor.blueColor()
     word.textColor = .whiteColor()
     //#############################################
     word.textAlignment = .Center
     word.numberOfLines = 1
     return word
     }()
     
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //#############################################
        view.backgroundColor = .whiteColor()
        //#############################################
        //self.view.addSubview(Subject)
        //view.addConstraintsWithFormat("H:|[v0]|", views: Subject)
        //view.addConstraintsWithFormat("V:|[v0(50)]", views: Subject)
        
        self.view.addSubview(collectionview)
        view.addConstraintsWithFormat("H:|[v0]|", views: collectionview)
        view.addConstraintsWithFormat("V:|[v0]|", views: collectionview)
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TutorialURL.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath)as! FeedCell
        
        if let lesson:Tutorial_Obj = self.TutorialURL[indexPath.item]{
            //print(lesson.TutorialName!)
            cell.tutorial_link = lesson
            return cell
        }
        
        
        //  return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((view.frame.width),(view.frame.height/10))
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5
    }
    
    var homecontroller:HomeController?
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if let Url:Tutorial_Obj = self.TutorialURL[indexPath.item]{
            print(Url)
            // self.homecontroller?.showControllerForTutorial(W)
            self.homecontroller?.PlayVideo(Url)
        }
        
        
    }
    
}
