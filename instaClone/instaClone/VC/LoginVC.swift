//
//  LoginVC.swift
//  instaClone
//
//  Created by Marina Beatriz Santana de Aguiar on 06.10.20.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    var username: String?
    var password: String?
    var ref: DatabaseReference!
    
    let instagramImage = UIImageView(image: UIImage(named: "instagram")!)
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    let signUpText = UILabel()
    let signUpButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        configure()
        
        ref = Database.database().reference()
    }
    
    
    private func configure() {
        // The line below strechtes the whole view if this ViewController is inside a NavigationController -- why?
        //view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        instagramImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(instagramImage)
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)
        usernameTextField.placeholder = "Phone numbers, username, or email"
        usernameTextField.font = UIFont.preferredFont(forTextStyle: .body)
        usernameTextField.textColor = .placeholderText
        usernameTextField.backgroundColor = .tertiarySystemBackground
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        passwordTextField.placeholder = "Password"
        passwordTextField.font = UIFont.preferredFont(forTextStyle: .body)
        passwordTextField.textColor = .placeholderText
        passwordTextField.backgroundColor = .tertiarySystemBackground

        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(.label, for: .normal)
        loginButton.setTitleColor(.systemGray6, for: .highlighted)
        loginButton.backgroundColor = .systemBlue
        
        signUpText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpText)
        signUpText.text = "Don't have an account?"
    
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpButton)
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.systemBlue, for: .normal)
        signUpButton.setTitleColor(.label, for: .highlighted)
        //signUpButton.addTarget(self, action: #selector(createUser), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(showSignUpPage), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            instagramImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            instagramImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            instagramImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            instagramImage.heightAnchor.constraint(equalToConstant: 100),
            
            usernameTextField.topAnchor.constraint(equalTo: instagramImage.bottomAnchor, constant: 25),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            usernameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 25),
            passwordTextField.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25),
            loginButton.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 45),

            signUpText.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            signUpText.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 25),
            signUpButton.leadingAnchor.constraint(equalTo: signUpText.trailingAnchor, constant: 5),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
        ])
        
    }
    
    @objc private func createUser() {
        Auth.auth().createUser(withEmail: usernameTextField.text!, password: passwordTextField.text!) { (authDataResult, error) in
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
        }
    }
    
    @objc private func showSignUpPage() {
        let signupVC = SignUpVC()
        showDetailViewController(signupVC, sender: self)
    }
    
    @objc private func dismissKeyboard() {
        _ = usernameTextField.isFirstResponder ? usernameTextField.resignFirstResponder() : passwordTextField.resignFirstResponder()
    }
    

}
