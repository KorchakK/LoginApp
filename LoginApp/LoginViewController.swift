//
//  ViewController.swift
//  LoginApp
//
//  Created by Konstantin Korchak on 08.03.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var userNameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var forgotUserButton: UIButton!
    @IBOutlet var forgotSPasswordButton: UIButton!
    
    private let username = "Konstantin"
    private let password = "hello"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameText.delegate = self
        passwordText.delegate = self
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.username = username
    }
        
    @IBAction func logInButtonPress() {
        if !verificationUser() {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password!")
            passwordText.text = ""
        }
    }
    
    @IBAction func forgotButtonsPress(_ sender: UIButton) {
        switch sender {
        case forgotUserButton: showAlert(title: "Ooops!", message: "Your name is \(username) 🐶")
        default: showAlert(title: "Ooops!", message: "Your password is \(password) 🐱")
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameText.text = ""
        passwordText.text = ""
    }
}

// MARK: - Methods
extension ViewController {
    
    private func showAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func verificationUser() -> Bool {
        userNameText.text == username && passwordText.text == password
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameText {
            userNameText.resignFirstResponder()
            passwordText.becomeFirstResponder()
        } else {
            logInButton.sendActions(for: .touchUpInside)
        }
        return true
    }
}
