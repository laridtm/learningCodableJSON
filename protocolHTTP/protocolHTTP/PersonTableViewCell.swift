//
//  PersonTableViewCell.swift
//  protocolHTTP
//
//  Created by Larissa Diniz  on 19/02/20.
//  Copyright © 2020 Larissa Diniz . All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var person: Person?
    
    func setLabels(person: Person) {
        firstNameLabel.text = person.first_name
        lastNameLabel.text = person.last_name
        ageLabel.text = "\(person.age)"
        
    }

}
