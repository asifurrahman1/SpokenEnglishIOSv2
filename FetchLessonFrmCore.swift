//
//  getFrmCore.swift
//  CoreDataJASONparsing
//
//  Created by Md Asifur Rahman on 9/11/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class FetchLessonFrmCore{
    
    var Obj = [VideoLessonModel]()
    var fetchResultController:NSFetchedResultsController!
    
    func fetchAndSetResult()->[VideoLessonModel]{
        
        
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchreq = NSFetchRequest(entityName: "VideoLessonModel")
        
        do{
            let results = try context.executeFetchRequest(fetchreq)
            Obj = results as! [VideoLessonModel]
            print("Core data fetch successful")
            
            
        }catch let err as NSError{
            print(err.description)
             print("fetch unsuccessful")
            print("ERR")
    
        }
        return Obj
    }
    
    // func PrintResult(){
    
    
}



