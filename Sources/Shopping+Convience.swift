//
//  Shopping+Convience.swift
//  ShoppingList
//
//  Created by Taylor Phillips on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation

import CoreData

extension Shopping{
    
    @discardableResult convenience init(item: String, gotIt: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init (context: context)
        self.item = item
        self.gotIt = gotIt
    }
    
}
