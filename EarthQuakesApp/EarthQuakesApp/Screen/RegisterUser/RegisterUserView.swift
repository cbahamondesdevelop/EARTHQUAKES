//
//  RegisterUserView.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 11-01-24.
//

import Foundation
import UIKit

class RegisterUserView: UIView {
    
    let textAPP = TextsInTheApp()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.nameUser
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.nameUser
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.lastName
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.lastName
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.passUser
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.passUser
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var repeatPassLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.repeatPassword
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var repeatPassTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.repeatPassword
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.email
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.email
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 5.0
        button.isEnabled = true
        button.setTitle(textAPP.createAccount, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        // button.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
}

extension RegisterUserView {
    
    private func buildViewHierarchy() {
        [nameLabel,
         nameTextField,
         lastNameLabel,
         lastNameTextField,
         passwordLabel,
         passwordTextField,
         repeatPassLabel,
         repeatPassTextField,
         emailLabel,
         emailTextField,
         loginButton].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                        
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            lastNameLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            lastNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                        
            lastNameTextField.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 10),
            lastNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lastNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            
            loginButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
