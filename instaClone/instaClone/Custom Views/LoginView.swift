//
//  LoginView.swift
//  instaClone
//
//  Created by Marina Beatriz Santana de Aguiar on 06.10.20.
//

import UIKit

class LoginView: UIView {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .cyan
        
        let usernameTextField = UITextField()
        usernameTextField.placeholder = "Phone numbers, username, or email"
        
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        
        let loginButton = UIButton()
        loginButton.setTitle("Log In", for: .normal)
    }
    
}
