//
//  AppDelegate.swift
//  MovieDBTestApp
//
//  Created by Abbas on 5/8/19.
//  Copyright © 2019 Abbas. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let persistHandler : PersistHandler = PersistHandler()

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        _ = WatchlistWorker.sharedInstance.loadMovies()
        window = UIWindow(frame: UIScreen.main.bounds)
        let firstViewController = ActorsViewController()
        let mainNavigationController = UINavigationController(rootViewController: firstViewController)
        window?.rootViewController = mainNavigationController
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = PersistHandler.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

