//
//  ShoppingController.swift
//  ShoppingList
//
//  Created by Taylor Phillips on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class ShoppingController {
    
    static let sharedController = ShoppingController()
    
    //crud
    
    //create
    func addItem(item: String){
    let _ = Shopping(item: item)
        
        saveToPersitenceStore()
    }
    //run
    var shoppingArray: [Shopping]{
        let request: NSFetchRequest<Shopping> = Shopping.fetchRequest()
        let moc = CoreDataStack.context
        
        do{
           return try moc.fetch(request)
        }catch{
            return []
        }
        
    }
    //update
    func updateItemIn(shoppingList shopping: Shopping){
        shopping.gotIt = !shopping.gotIt
        
        saveToPersitenceStore()
    }
    
    //delete
    func delete(shopping: Shopping){
        let moc = CoreDataStack.context
        moc.delete(shopping)
        
        saveToPersitenceStore()
    }
    //save
    func saveToPersitenceStore() {
        let moc = CoreDataStack.context
        do{
            try moc.save()
        }catch {
            print("Yo momma so fat we had no room to save yo data to the managed object context. P.S. Thanks Spencer for going over this with us. It helped solidify everything.")
        }
        
        
    }
    
}
