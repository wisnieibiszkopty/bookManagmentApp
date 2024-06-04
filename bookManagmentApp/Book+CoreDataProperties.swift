//
//  Book+CoreDataProperties.swift
//  bookManagmentApp
//
//  Created by student on 04/06/2024.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var tittle: String?
    @NSManaged public var genre: String?
    @NSManaged public var author: Author?
    @NSManaged public var library: Library?

}

extension Book : Identifiable {

}
