//
//  CoreDataManager.swift
//  TheSwitcher_AlexandrePortoAlegre
//
//  Created by Alexandre Porto Alegre Fernandes on 30/01/23.
//

import CoreData

final class CoreDataManager {
    
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    func fetchData() -> [Room]? {
        do {
            let items = try context.fetch(Room.fetchRequest())
            return items
        } catch {
            NSLog("Error while fetching data - \(error.localizedDescription)")
        }
        return nil
    }
    
    func createData(name: String) {
        let newRoom = Room(context: context)
        newRoom.name = name
        newRoom.light = false
        newRoom.createdAt = Date()
        
        do {
            try context.save()
        } catch {
            NSLog("Error while creating data - \(error.localizedDescription)")
        }
    }
    
    func updateData(item: Room, lightState: Bool){
        item.light = lightState
        do {
            try context.save()
        } catch {
            NSLog("Error while updating data - \(error.localizedDescription)")
        }
    }
}
