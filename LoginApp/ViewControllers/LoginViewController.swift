//
//  ViewController.swift
//  LoginApp
//
//  Created by Konstantin Korchak on 08.03.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var userNameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameText.delegate = self
        passwordText.delegate = self
    }
    
    @IBAction func logInButtonPress() {
        guard verificationUser() else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password!",
                textField: passwordText
            )
            return
        }
        performSegue(withIdentifier: "welcomeScreenSegue", sender: nil)
    }
    
    @IBAction func forgotButtonsPress(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Ooops!", message: "Your name is \(user.username) 🐶")
        : showAlert(title: "Ooops!", message: "Your password is \(user.password) 🐱")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameText.text = ""
        passwordText.text = ""
    }
}

// MARK: - Methods
extension LoginViewController {
    
    private func showAlert (title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style: .default) { _ in
                textField?.text = ""
            }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func verificationUser() -> Bool {
        userNameText.text == user.username && passwordText.text == user.password
    }
}

// MARK: - Keyboard setup
extension LoginViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameText {
            passwordText.becomeFirstResponder()
        } else {
            logInButtonPress()
        }
        return true
    }
}

// MARK: - Navi
extension LoginViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                guard let infoVC = navigationVC.topViewController as? InformationViewController else { return }
                infoVC.user = user
            }
        }
    }
}
