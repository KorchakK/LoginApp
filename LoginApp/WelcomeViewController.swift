//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Konstantin Korchak on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet var welcomeLabel: UILabel!
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(username ?? "")!"
        
        let color1 = UIColor(red: 0, green: 0.8, blue: 0, alpha: 1).cgColor
        let color2 = UIColor(red: 0, green: 0, blue: 0.8, alpha: 1).cgColor
        
        let gradientColor = CAGradientLayer()
        gradientColor.frame = self.view.bounds
        gradientColor.colors = [color1, color2]
        gradientColor.startPoint = CGPoint(x: 0, y: 0)
        gradientColor.endPoint = CGPoint(x: 0, y: 1)
        self.view.layer.insertSublayer(gradientColor, at: 0)
    }
    
    @IBAction func logOutButtonPressed() {
        dismiss(animated: true)
    }
}
