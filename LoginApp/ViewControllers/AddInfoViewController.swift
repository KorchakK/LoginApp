//
//  AddInfoViewController.swift
//  LoginApp
//
//  Created by Konstantin Korchak on 13.03.2022.
//

import UIKit

class AddInfoViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var workLabel: UILabel!
    @IBOutlet var educationLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var hobbies: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user.person.name
        surnameLabel.text = user.person.surname
        ageLabel.text = String(user.person.age)
        cityLabel.text = user.person.city
        countryLabel.text = user.person.country
        genderLabel.text = user.person.gender.rawValue
        workLabel.text = user.person.work
        educationLabel.text = user.person.education
        statusLabel.text = user.person.status.rawValue
        hobbies.text = "Hobbies: \(user.person.hobby.joined(separator: ", "))"
    }
}
