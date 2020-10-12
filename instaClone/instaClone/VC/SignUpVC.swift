//
//  SignUpVC.swift
//  instaClone
//
//  Created by Marina Beatriz Santana de Aguiar on 10.10.20.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    let emailField = UITextField()
    let fullNameField = UITextField()
    let usernameField = UITextField()
    let passwordField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    private func configure() {
        //view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        let pageLabel = UILabel()
        view.addSubview(pageLabel)
        pageLabel.translatesAutoresizingMaskIntoConstraints = false
        pageLabel.text = "Sign Up"
        pageLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        view.addSubview(emailField)
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.font = UIFont.preferredFont(forTextStyle: .body)
        emailField.textColor = .placeholderText
        emailField.borderStyle = .roundedRect
        
        emailField.placeholder = "Email"
        
        view.addSubview(fullNameField)
        fullNameField.translatesAutoresizingMaskIntoConstraints = false
        fullNameField.font = UIFont.preferredFont(forTextStyle: .body)
        fullNameField.textColor = .placeholderText
        fullNameField.borderStyle = .roundedRect
        fullNameField.placeholder = "Full Name"
        
        view.addSubview(usernameField)
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        usernameField.font = UIFont.preferredFont(forTextStyle: .body)
        usernameField.textColor = .placeholderText
        usernameField.borderStyle = .roundedRect
    
        usernameField.placeholder = "Username"
        
        view.addSubview(passwordField)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.font = UIFont.preferredFont(forTextStyle: .body)
        passwordField.textColor = .placeholderText
        passwordField.borderStyle = .roundedRect
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        //passwordField.passwordRules

                
        let nextButton = UIButton()
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(createUser), for: .touchUpInside)
        nextButton.backgroundColor = .systemBlue
        nextButton.setTitleColor(.label, for: .normal)
        nextButton.setTitleColor(.systemGray6, for: .highlighted)
        
        NSLayoutConstraint.activate([
            pageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            pageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //pageLabel.heightAnchor.constraint(equalToConstant: 50),
            
            emailField.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 40),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            emailField.heightAnchor.constraint(equalToConstant: 45),
            
            fullNameField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 25),
            fullNameField.leadingAnchor.constraint(equalTo: emailField.leadingAnchor),
            fullNameField.trailingAnchor.constraint(equalTo: emailField.trailingAnchor),
            fullNameField.heightAnchor.constraint(equalToConstant: 45),
            
            usernameField.topAnchor.constraint(equalTo: fullNameField.bottomAnchor, constant: 25),
            usernameField.leadingAnchor.constraint(equalTo: emailField.leadingAnchor),
            usernameField.trailingAnchor.constraint(equalTo: emailField.trailingAnchor),
            usernameField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 25),
            passwordField.leadingAnchor.constraint(equalTo: emailField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: emailField.trailingAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 45),
            
            nextButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 25),
            nextButton.leadingAnchor.constraint(equalTo: emailField.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: emailField.trailingAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    
    @objc private func createUser() {
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (authDataResult, error) in

            if let authResult = authDataResult {
                print("auth: \(authResult.user)")
                print("auth: \(authResult.user.uid)")
                print("auth: \(authResult.user.metadata)")
                print("auth: \(authResult.user.providerData)")
                print("info: \(authResult.user.multiFactor.enrolledFactors)")
            }
            
            if let authError = error {
                print("error: \(authError)")
            }
            
            self.dismiss(animated: true)
            
            
            
        }
    }


}
