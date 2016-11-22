//
//  TutorialDetailsCell.swift
//  Learning_App_test2
//
//  Created by Md Asifur Rahman on 9/9/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//

import UIKit

class TutorialDetailsCell:BaseCell{
    
    let cellId = "cellID"
    
    
    var currentday : PerDay? {
        didSet{
            Day.text = "Day : \(currentday!.DayNo!)"
        }
    }
    
    
    
    
    
    let Day: UILabel = {
        let word = UILabel()
        word.translatesAutoresizingMaskIntoConstraints = false
        word.text = "Day:1"
        
        //************COLOR*****************
        word.backgroundColor = Colors.DayCellColor//UIColor.blueColor()
        word.textColor = Colors.DayCellTextColor//UIColor.whiteColor()
        //*********************************
        word.textAlignment = .Center
        word.font = UIFont.systemFontOfSize(30, weight: 10)
        return word
    }()
    
    
    
    override func setupViews() {
        backgroundColor = Colors.body//.blueColor()
        addSubview(Day)
        addConstraintsWithFormat("H:|[v0]|", views: Day)
        addConstraintsWithFormat("V:|[v0]|", views: Day)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5;
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(frame.width,100 )
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5
    }
    
    
    
    
    
}
