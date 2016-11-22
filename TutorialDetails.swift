//
//  TutorialDetails.swift
//  Learning_App_test2
//
//  Created by Md Asifur Rahman on 9/9/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.


import UIKit

class TutorialDetails: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    
    
    var tutorails: TutorialWeek? {
        didSet {
            self.week_days = tutorails!.days!
            print(self.week_days)
        }
    }
    
    var week_days = [PerDay]()
    
    
    
    lazy var collectionview:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //#############################################
        cv.backgroundColor = Colors.body //UIColor.whiteColor()
        //#############################################
        cv.dataSource = self
        cv.delegate = self
        cv.registerClass(TutorialDetailsCell.self, forCellWithReuseIdentifier: "cellId")
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
        view.backgroundColor = Colors.body//.whiteColor()
        //#############################################
        //self.view.addSubview(Subject)
        //view.addConstraintsWithFormat("H:|[v0]|", views: Subject)
        //view.addConstraintsWithFormat("V:|[v0(50)]", views: Subject)
        
        self.view.addSubview(collectionview)
        view.addConstraintsWithFormat("H:|-5-[v0]-5-|", views: collectionview)
        view.addConstraintsWithFormat("V:|-55-[v0]|", views: collectionview)
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return week_days.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath)as! TutorialDetailsCell
        // cell.backgroundColor = .redColor(
        cell.layer.cornerRadius = 6
        cell.currentday = self.week_days[indexPath.item]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        // let height = (frame.width - 16 - 16) * 9 / 16
        return CGSizeMake((view.frame.width/3)-10,(view.frame.height/4)-10)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5
    }
    
    var homecontroller:HomeController?
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if let D:PerDay = self.week_days[indexPath.item]{
            print(D.DayNo!)
            
            // self.homecontroller?.showControllerForTutorial(W)
            self.homecontroller?.tutorialDaysLauncher(D)
        }
    }
    
    
}
