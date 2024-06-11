//
//  Author+CoreDataProperties.swift
//  bookManagmentApp
//
//  Created by student on 11/06/2024.
//
//

import Foundation
import CoreData


extension Author {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Author> {
        return NSFetchRequest<Author>(entityName: "Author")
    }

    @NSManaged public var name: String?
    @NSManaged public var surname: String?
    @NSManaged public var toBook: NSSet?

}

// MARK: Generated accessors for toBook
extension Author {

    @objc(addToBookObject:)
    @NSManaged public func addToToBook(_ value: Book)

    @objc(removeToBookObject:)
    @NSManaged public func removeFromToBook(_ value: Book)

    @objc(addToBook:)
    @NSManaged public func addToToBook(_ values: NSSet)

    @objc(removeToBook:)
    @NSManaged public func removeFromToBook(_ values: NSSet)

}

extension Author : Identifiable {

}
