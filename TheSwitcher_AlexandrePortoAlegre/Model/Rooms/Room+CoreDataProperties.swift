//
//  Rooms+CoreDataProperties.swift
//  TheSwitcher_AlexandrePortoAlegre
//
//  Created by Alexandre Porto Alegre Fernandes on 30/01/23.
//
//

import Foundation
import CoreData


extension Room {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Room> {
        return NSFetchRequest<Room>(entityName: "Room")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var light: Bool

}

extension Room : Identifiable {

}
