//
//  get.swift
//  CoreDataJASONparsing
//
//  Created by Md Asifur Rahman on 9/11/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//

import Foundation
import Alamofire
import CoreData

class VideoLessonParsing{
    
    func JASON2Core(url:String){
        
        Alamofire.request(.GET, url).responseJSON {response in
            if let Obj = response.result.value as? [Dictionary<String,AnyObject>] {
                
                for element in Obj{
                    if let name = element["Name"] as? String{
                        if let url = element["Link"] as? String{
                            print("\(name)-----------\(url)")
                           
                            //############## CORE DATA SAVE ###################
                            let app = UIApplication.sharedApplication().delegate as! AppDelegate
                            let context = app.managedObjectContext
                            
                            let entity = NSEntityDescription.entityForName("VideoLessonModel", inManagedObjectContext: context)!
                            let v = VideoLessonModel(entity: entity, insertIntoManagedObjectContext: context)
                            v.name = name
                            v.url = url
                            
                            
                            context.insertObject(v)
                            
                            do{
                                try context.save()
                                print("successfully saved")
                            }catch{
                                fatalError("ERRR")
                            }
                            
                            
                        }
                        
                    }
                }
            }
        }
    }
}