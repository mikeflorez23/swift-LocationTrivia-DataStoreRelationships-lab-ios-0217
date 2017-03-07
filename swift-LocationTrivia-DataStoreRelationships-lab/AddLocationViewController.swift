//
//  AddLocationViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Michael on 3/6/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class AddLocationViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.accessibilityLabel = "nameField"
        nameTextField.accessibilityIdentifier = "nameField"
        latitudeTextField.accessibilityIdentifier = "latitudeField"
        latitudeTextField.accessibilityLabel = "latitudeField"
        longitudeTextField.accessibilityLabel = "longitudeField"
        longitudeTextField.accessibilityIdentifier = "longitudeField"
        
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text,
            let latitude = latitudeTextField.text,
            let longitude = longitudeTextField.text,
            let latitudeFloat = Float(latitude),
            let longitudeFloat = Float(longitude) else { return }
        let newLocation = Location(name: name, latitude: latitudeFloat, longitude: longitudeFloat)
        LocationDataStore.shared.locations.append(newLocation)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
