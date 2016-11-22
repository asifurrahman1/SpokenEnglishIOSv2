//
//  TutorialCell.swift
//  Learning_App_test2
//
//  Created by Md Asifur Rahman on 9/9/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//

import UIKit

class TutorialCell: BaseCell{
    
    
    var Week: TutorialWeek? {
        didSet{
            
            self.week.text = String("Week no : \(Week!.WeekNo!)")
            // print(Week?.Sub?.subject_name!)
        }
    }
    
    
    
    
    
    let week: UILabel = {
        let w = UILabel()
        //=========================================
        w.backgroundColor =  Colors.WeekCellColor //UIColor.blueColor()
        w.textColor = Colors.WeekCellTextColor//UIColor.whiteColor()
        //=========================================
        w.text = "Week no"
        w.textAlignment = .Center
        return w
    }()
    
    let Sub: UILabel = {
        let s = UILabel()
        //=======================================
        s.backgroundColor = Colors.WeekCellColor//UIColor.blueColor()
        s.text = "Vocab"
        s.textAlignment = .Center
        s.textColor = Colors.WeekCellTextColor//UIColor.whiteColor()
        //=======================================
        return s
    }()
    
    
    
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = Colors.body
        addSubview(week)
        addSubview(Sub)
        addConstraintsWithFormat("H:|[v0]|", views: week)
        addConstraintsWithFormat("H:|[v0]|", views: Sub)
        addConstraintsWithFormat("V:|-1-[v0(48)]", views: week)
        addConstraintsWithFormat("V:|-49-[v0(48)]", views: Sub)
        
    }
    
    
    
}
