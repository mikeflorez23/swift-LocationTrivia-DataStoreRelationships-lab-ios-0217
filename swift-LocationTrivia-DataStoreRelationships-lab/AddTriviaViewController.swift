//
//  AddTriviaViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Michael on 3/6/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class AddTriviaViewController: UIViewController {
    
    var location: Location!

    @IBOutlet weak var triviaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        triviaTextField.accessibilityLabel = "Trivium Text Field"
        triviaTextField.accessibilityIdentifier = "Trivium Text Field"
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let triviaText = triviaTextField.text else { return }
        let newTrivia = Trivium(content: triviaText, likes: 0)
        location.trivia.append(newTrivia)
        dismiss(animated: true, completion: nil)
        
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
