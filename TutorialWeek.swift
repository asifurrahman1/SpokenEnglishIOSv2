//
//  TutorialWeek.swift
//  Learning_App_test2
//
//  Created by Md Asifur Rahman on 9/9/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//

import UIKit


class TutorialWeek:NSObject{
    var WeekNo: Int?
    var days:[PerDay]?
}





class PerDay:NSObject{
    var DayNo :Int?
    var Days_tutorials:[Tutorial_Obj]?
}

class Tutorial_Obj:NSObject{
    var  TutorialName : String?
    var Tutorial_url : String?
}
