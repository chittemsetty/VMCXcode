//
//  Destination+CoreDataProperties.swift
//  maptest
//
//  Created by Venu Chittemsetty on 3/5/16.
//  Copyright © 2016 Vedya Wonders. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Destination {

    @NSManaged var latt: NSNumber?
    @NSManaged var lattDelta: NSNumber?
    @NSManaged var longi: NSNumber?
    @NSManaged var longiDelta: NSNumber?
    @NSManaged var name: String?

}
