//
//  SignUpVC.swift
//  instaClone
//
//  Created by Marina Beatriz Santana de Aguiar on 10.10.20.
//

import UIKit

class SignUpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    private func configure() {
        //view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        let pageLabel = UILabel()
        view.addSubview(pageLabel)
        pageLabel.text = "Sign Up"
        pageLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        pageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let emailField = UITextField()
        view.addSubview(emailField)
        emailField.font = UIFont.preferredFont(forTextStyle: .body)
        emailField.textColor = .placeholderText
        emailField.borderStyle = .roundedRect
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.placeholder = "Email"
        
        let fullNameField = UITextField()
        view.addSubview(fullNameField)
        fullNameField.font = UIFont.preferredFont(forTextStyle: .body)
        fullNameField.textColor = .placeholderText
        fullNameField.borderStyle = .roundedRect
        fullNameField.translatesAutoresizingMaskIntoConstraints = false
        fullNameField.placeholder = "Full Name"
        
        let usernameField = UITextField()
        view.addSubview(usernameField)
        usernameField.font = UIFont.preferredFont(forTextStyle: .body)
        usernameField.textColor = .placeholderText
        usernameField.borderStyle = .roundedRect
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        usernameField.placeholder = "Username"
        
        let passwordField = UITextField()
        view.addSubview(passwordField)
        passwordField.font = UIFont.preferredFont(forTextStyle: .body)
        passwordField.textColor = .placeholderText
        passwordField.borderStyle = .roundedRect
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.placeholder = "Password"
        
        let nextButton = UIButton()
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = .systemBlue
        nextButton.setTitleColor(.label, for: .normal)
        nextButton.setTitleColor(.systemGray6, for: .highlighted)
        
        NSLayoutConstraint.activate([
            pageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            pageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageLabel.heightAnchor.constraint(equalToConstant: 50),
            
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


}
