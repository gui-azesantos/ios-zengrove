//
//  UIViewController+CoreData.swift
//  ESG-ZenGrove
//
//  Created by De Azevedo Santos, Guilherme on 07/03/24.
//

import UIKit
import CoreData

extension UIViewController {
    var context : NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
}
