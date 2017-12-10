//
//  AppDelegate.swift
//  FamilyMovies
//
//  Created by Donny Wals on 30/07/16.
//  Copyright © 2016 DonnyWals. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FamilyMovies")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        })
        return container
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        if let tabBarController = window?.rootViewController as? UITabBarController,
            let viewControllers = tabBarController.viewControllers {
            for viewController in viewControllers {
                guard let navVC = viewController as? UINavigationController,
                    var mocVC = navVC.viewControllers[0] as? MOCViewControllerType
                    else { continue }
                
                mocVC.managedObjectContext = persistentContainer.viewContext
            }
        }
        
        application.setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum)
        
        return true
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        let managedObjectContext = persistentContainer.viewContext
        guard let allMovies = try? managedObjectContext.fetch(fetchRequest) else {
            completionHandler(.failed)
            return
        }
        
        let queue = DispatchQueue(label: "movieDBQueue")
        let group = DispatchGroup()
        let helper = MovieDBHelper()
        var dataChanged = false
        
        for movie in allMovies {
            queue.async(group: group) {
                group.enter()
                helper.fetchRating(forMovieId: movie.remoteId) { id, popularity in
                    guard let popularity = popularity,
                        popularity != movie.popularity else {
                            group.leave()
                            return
                    }
                    
                    dataChanged = true
                    
                    managedObjectContext.persist {
                        movie.popularity = popularity
                        group.leave()
                    }
                }
            }
        }
        
        group.notify(queue: DispatchQueue.main) {
            if dataChanged {
                completionHandler(.newData)
            } else {
                completionHandler(.noData)
            }
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        persistentContainer.saveContextIfNeeded()
    }


}

