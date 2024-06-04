//
//  Library+CoreDataProperties.swift
//  bookManagmentApp
//
//  Created by student on 04/06/2024.
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
    @NSManaged public var books: NSSet?

}

// MARK: Generated accessors for books
extension Library {

    @objc(addBooksObject:)
    @NSManaged public func addToBooks(_ value: Book)

    @objc(removeBooksObject:)
    @NSManaged public func removeFromBooks(_ value: Book)

    @objc(addBooks:)
    @NSManaged public func addToBooks(_ values: NSSet)

    @objc(removeBooks:)
    @NSManaged public func removeFromBooks(_ values: NSSet)

}

extension Library : Identifiable {

}
