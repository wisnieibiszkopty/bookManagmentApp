//
//  Book+CoreDataProperties.swift
//  bookManagmentApp
//
//  Created by student on 13/06/2024.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var genre: String?
    @NSManaged public var title: String?
    @NSManaged public var returnDate: Date?
    @NSManaged public var toAuthor: Author?
    @NSManaged public var toLibrary: NSSet?

    public var libraryArray: [Library] {
        let set = toLibrary as? Set<Library> ?? []
        
        return set.sorted {
            $0.name! < $1.name!
        }
    }
}

// MARK: Generated accessors for toLibrary
extension Book {

    @objc(addToLibraryObject:)
    @NSManaged public func addToToLibrary(_ value: Library)

    @objc(removeToLibraryObject:)
    @NSManaged public func removeFromToLibrary(_ value: Library)

    @objc(addToLibrary:)
    @NSManaged public func addToToLibrary(_ values: NSSet)

    @objc(removeToLibrary:)
    @NSManaged public func removeFromToLibrary(_ values: NSSet)

}

extension Book : Identifiable {

}
