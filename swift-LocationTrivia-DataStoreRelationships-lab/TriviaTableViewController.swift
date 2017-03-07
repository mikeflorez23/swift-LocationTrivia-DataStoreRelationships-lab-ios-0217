//
//  TriviaTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Michael on 3/6/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class TriviaTableViewController: UITableViewController {
    
    var location: Location!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.accessibilityLabel = "Trivia Table"
        self.tableView.accessibilityIdentifier = "Trivia Table"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location.trivia.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
        
        let value = location.trivia[indexPath.row]
        
        cell.textLabel?.text = value.content
        cell.detailTextLabel?.text = String(value.likes)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as? AddTriviaViewController
        dest?.location = self.location
    }
    
    
}
