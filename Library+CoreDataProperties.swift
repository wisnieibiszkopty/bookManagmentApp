//
//  Library+CoreDataProperties.swift
//  bookManagmentApp
//
//  Created by student on 13/06/2024.
//
//

import Foundation
import CoreData


extension Library {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Library> {
        return NSFetchRequest<Library>(entityName: "Library")
    }

    @NSManaged public var address: String?
    @NSManaged public var name: String?
    @NSManaged public var longitude: Double
    @NSManaged public var latitude: Double
    @NSManaged public var toBook: NSSet?

}

// MARK: Generated accessors for toBook
extension Library {

    @objc(addToBookObject:)
    @NSManaged public func addToToBook(_ value: Book)

    @objc(removeToBookObject:)
    @NSManaged public func removeFromToBook(_ value: Book)

    @objc(addToBook:)
    @NSManaged public func addToToBook(_ values: NSSet)

    @objc(removeToBook:)
    @NSManaged public func removeFromToBook(_ values: NSSet)

}

extension Library : Identifiable {

}
