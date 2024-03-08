//
//  ESG+CoreDataProperties.swift
//  ESG-ZenGrove
//
//  Created by De Azevedo Santos, Guilherme on 07/03/24.
//
//

import Foundation
import CoreData


extension ESG {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ESG> {
        return NSFetchRequest<ESG>(entityName: "ESG")
    }

    @NSManaged public var title: String?
    @NSManaged public var type: String?
    @NSManaged public var pontuation: String?

}

extension ESG : Identifiable {

}
