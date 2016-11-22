//
//  JASONPARSE.swift
//  SpokenEnglishIOSv2
//
//  Created by Md Asifur Rahman on 9/11/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//

import Foundation

import Foundation
import Alamofire
import CoreData

class JASONPARSE{
    var daysTutorial:[Tutorial_Obj]?
    
    func JASON2data(url:String){
        
        Alamofire.request(.GET, url).responseJSON {response in
            if let Obj = response.result.value as? [Dictionary<String,AnyObject>] {
                
            
                for element in Obj{
                    
                     if let name = element["Name"] as? String  , let url = element["Link"] as? String{
                        var t = Tutorial_Obj()
                        t.TutorialName = name
                        t.Tutorial_url = url
                        self.daysTutorial?.append(t)
                        }
                    
                    }
                
                }
            
            }
    }
}

    

