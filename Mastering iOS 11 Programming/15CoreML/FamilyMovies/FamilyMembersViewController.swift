//
//  FamilyMembersViewController.swift
//  FamilyMovies
//
//  Created by Donny Wals on 30/07/16.
//  Copyright © 2016 DonnyWals. All rights reserved.
//

import UIKit
import CoreData
import CoreSpotlight

class FamilyMembersViewController: UIViewController, AddFamilyMemberDelegate, MOCViewControllerType {
    
    @IBOutlet var tableView: UITableView!
    
    var managedObjectContext: NSManagedObjectContext?
    var fetchedResultsController: NSFetchedResultsController<FamilyMember>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let moc = managedObjectContext
            else { return }
        
        let request = NSFetchRequest<FamilyMember>(entityName: "FamilyMember")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request,
                                                              managedObjectContext: moc,
                                                              sectionNameKeyPath: nil,
                                                              cacheName: nil)
        
        fetchedResultsController?.delegate = self
        
        do {
            try fetchedResultsController?.performFetch()
        } catch {
            print("fetch request failed")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.userActivity = IndexingFactory.activity(withType: .openTab, name: "Family Members", makePublic: true)
        self.userActivity?.becomeCurrent()
    }
    
    func saveFamilyMember(withName name: String) {
        guard let moc = managedObjectContext
            else { return }
        
        moc.persist {
            let familyMember = FamilyMember(context: moc)
            familyMember.name = name
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navVC = segue.destination as? UINavigationController,
            let addFamilyMemberVC = navVC.viewControllers[0] as? AddFamilyMemberViewController {
            addFamilyMemberVC.delegate = self
        }
        
        guard let selectedIndex = tableView.indexPathForSelectedRow
            else { return }
        
        if let moviesVC = segue.destination as? MoviesViewController,
            let familyMember = fetchedResultsController?.object(at: selectedIndex) {
                moviesVC.managedObjectContext = managedObjectContext
                moviesVC.familyMember = familyMember
        }
        
        tableView.deselectRow(at: selectedIndex, animated: true)
    }

}

extension FamilyMembersViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            guard let insertIndex = newIndexPath,
                let familyMember = fetchedResultsController?.object(at: insertIndex)
                else { return }
            
            let item = IndexingFactory.searchableItem(forFamilyMember: familyMember)
            CSSearchableIndex.default().indexSearchableItems([item], completionHandler: nil)
            
            tableView.insertRows(at: [insertIndex], with: .automatic)
        case .delete:
            guard let deleteIndex = indexPath
                else { return }
            tableView.deleteRows(at: [deleteIndex], with: .automatic)
        case .move:
            guard let fromIndex = indexPath,
                let toIndex = newIndexPath
                else { return }
            tableView.moveRow(at: fromIndex, to: toIndex)
        case .update:
            guard let updateIndex = indexPath
                else { return }
            tableView.reloadRows(at: [updateIndex], with: .automatic)
        }
    }
}

extension FamilyMembersViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController?.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FamilyMemberCell")
            else { fatalError("Wrong cell identifier requested") }
        
        guard let familyMember = fetchedResultsController?.object(at: indexPath)
            else { return cell }
        cell.textLabel?.text = familyMember.name
        
        return cell
    }
}
