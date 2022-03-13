//
//  InformationViewController.swift
//  LoginApp
//
//  Created by Konstantin Korchak on 13.03.2022.
//

import UIKit

class InformationViewController: UIViewController {
    @IBOutlet var avatarImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImage.layer.cornerRadius = 10
        
        nameLabel.text = user.person.name
        surnameLabel.text = user.person.surname
        ageLabel.text = String(user.person.age)
        cityLabel.text = user.person.city
    }
}

// MARK: - Navi
extension InformationViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addInfoVC = segue.destination as? AddInfoViewController {
            addInfoVC.user = user
        }
    }
}
