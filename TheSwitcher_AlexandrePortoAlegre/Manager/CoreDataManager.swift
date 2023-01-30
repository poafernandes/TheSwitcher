//
//  CoreDataManager.swift
//  TheSwitcher_AlexandrePortoAlegre
//
//  Created by Alexandre Porto Alegre Fernandes on 30/01/23.
//

import CoreData

final class CoreDataManager {
    private let modelName: String
        
    init(modelName: String) {
        self.modelName = Constants.Storage.Model
    }
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        guard let modelURL = Bundle.main.url(forResource: self.modelName, withExtension: "momd") else {
            fatalError("Unable to locate \(self.modelName)")
        }

        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Unable to load data")
        }

        return managedObjectModel
    }()

    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)

        let fileManager = FileManager()
        let storeFilename = "\(self.modelName).sqlite"

        guard let libraryDirectoryURL = fileManager.urls(for: .libraryDirectory, in: .userDomainMask).first else {
            fatalError("Unable do get library URL")
        }
        let persistentStoreURL = libraryDirectoryURL.appendingPathComponent(storeFilename)
        
        #if DEBUG
            print(persistentStoreURL)
        #endif
        
        do {
            try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                                              configurationName: nil,
                                                              at: persistentStoreURL,
                                                              options: nil)
        } catch {
            fatalError("Unable to add persistent store")
        }
        
        return persistentStoreCoordinator
    }()
    
    private(set) lazy var managedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator
        return managedObjectContext
        
    }()

}
