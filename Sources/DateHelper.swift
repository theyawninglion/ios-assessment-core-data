//
//  DateHelper.swift
//  ShoppingList
//
//  Created by Taylor Phillips on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation

extension Date{
    func stringValue() -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
}
