//
//  VideoLessonModel+CoreDataProperties.swift
//  SpokenEnglishIOSv2
//
//  Created by Md Asifur Rahman on 9/11/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension VideoLessonModel {

    @NSManaged var name: String?
    @NSManaged var url: String?

}
