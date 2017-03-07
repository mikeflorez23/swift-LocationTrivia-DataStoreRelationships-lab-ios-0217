//
//  LocationsTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Michael on 3/6/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class LocationsTableViewController: UITableViewController {
    
    let store = LocationDataStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.generateStartingLocationsData()
        self.tableView.accessibilityLabel = "Locations Table"
        self.tableView.accessibilityIdentifier = "Locations Table"
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "addButton"
        self.navigationItem.rightBarButtonItem?.accessibilityLabel = "addButton"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.locations.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        
        let value = store.locations[indexPath.row]
        
        cell.textLabel?.text = value.name
        cell.detailTextLabel?.text = String(value.trivia.count)
        
        return cell
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTrivaTVC" {
            if let dest = segue.destination as? TriviaTableViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                let tappedLocation = store.locations[indexPath.row]
                dest.location = tappedLocation
            }
        }
        
    }
}



