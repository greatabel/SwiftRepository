//
//  MoviesViewController.swift
//  FamilyMovies
//
//  Created by Donny Wals on 30/07/16.
//  Copyright © 2016 DonnyWals. All rights reserved.
//

import UIKit
import CoreData
import CoreSpotlight

class MoviesViewController: UIViewController, AddMovieDelegate, MOCViewControllerType {
    
    @IBOutlet var tableView: UITableView!
    var familyMember: FamilyMember?
    var managedObjectContext: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(self.mangedObjectContextDidChange(notification:)), name: .NSManagedObjectContextObjectsDidChange,
                           object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let familyMemberName = familyMember?.name
            else { return }
        
        self.userActivity = IndexingFactory.activity(withType: .familyMemberDetailView, name: familyMemberName, makePublic: false)
        self.userActivity?.becomeCurrent()
    }
    
    deinit {
        let center = NotificationCenter.default
        center.removeObserver(self, name: .NSManagedObjectContextObjectsDidChange, object: nil)
    }
    
    func saveMovie(withName name: String) {
        guard let moc = managedObjectContext,
            let familyMember = self.familyMember
            else { return }
        
        moc.persist {
            let movie = Movie.find(byName: name, orCreateIn: moc)
            if movie.name == nil || movie.name?.isEmpty == true {
                movie.name = name
            }
            
            let newFavorites: Set<AnyHashable> = familyMember.favoriteMovies?.adding(movie) ?? [movie]
            familyMember.favoriteMovies = NSSet(set: newFavorites)
            
            let helper = MovieDBHelper()
            helper.fetchRating(forMovie: name) { remoteId, rating in
                guard let rating = rating,
                    let remoteId = remoteId
                    else { return }
                
                moc.persist {
                    movie.popularity = rating
                    movie.remoteId = Int64(remoteId)
                }
            }
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navVC = segue.destination as? UINavigationController,
            let addMovieVC = navVC.viewControllers[0] as? AddMovieViewController {
            
            addMovieVC.delegate = self
        }
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return familyMember?.favoriteMovies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell"),
            let movies = familyMember?.favoriteMovies
            else { fatalError("Wrong cell identifier requested") }
        
        let moviesArray = Array(movies as! Set<Movie>)
        let movie = moviesArray[indexPath.row]
        cell.textLabel?.text = movie.name
        cell.detailTextLabel?.text = "Rating: \(movie.popularity)"
        
        return cell
    }
}

extension MoviesViewController {
    @objc func mangedObjectContextDidChange(notification: NSNotification) {
        guard let userInfo = notification.userInfo
            else { return }
        
        if let updatedObjects = userInfo[NSUpdatedObjectsKey] as? Set<FamilyMember>,
            let familyMember = self.familyMember,
            updatedObjects.contains(familyMember) {
            
            let item = IndexingFactory.searchableItem(forFamilyMember: familyMember)
            CSSearchableIndex.default().indexSearchableItems([item], completionHandler: nil)
            
            tableView.reloadData()
        }
        
        if let updatedObjects = userInfo[NSUpdatedObjectsKey] as? Set<Movie> {
            for object in updatedObjects {
                let item = IndexingFactory.searchableItem(forMovie: object)
                CSSearchableIndex.default().indexSearchableItems([item], completionHandler: nil)
                
                if let familyMember = self.familyMember,
                let familyMembers = object.familyMembers,
                    familyMembers.contains(familyMember) {
                    tableView.reloadData()
                    break
                }
            }
        }
    }
}
