//
//  RegisterUserView.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 11-01-24.
//

import Foundation
import UIKit

protocol RegisterUserViewDelegate: AnyObject {
    func didTapCreateAccount()
}

class RegisterUserView: UIView {
    
    let textAPP = TextsInTheApp()
    weak var delegate: RegisterUserViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.registerUser
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
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
    
    private lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 5.0
        button.isEnabled = true
        button.setTitle(textAPP.createAccount, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
}

extension RegisterUserView {
    
    private func buildViewHierarchy() {
        [titleLabel,
         nameLabel,
         nameTextField,
         lastNameLabel,
         lastNameTextField,
         passwordLabel,
         passwordTextField,
         repeatPassLabel,
         repeatPassTextField,
         emailLabel,
         emailTextField,
         createAccountButton].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                        
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            lastNameLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            lastNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                        
            lastNameTextField.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 10),
            lastNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lastNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            passwordLabel.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                        
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            repeatPassLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            repeatPassLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                        
            repeatPassTextField.topAnchor.constraint(equalTo: repeatPassLabel.bottomAnchor, constant: 10),
            repeatPassTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            repeatPassTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            emailLabel.topAnchor.constraint(equalTo: repeatPassTextField.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                        
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            createAccountButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            createAccountButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            createAccountButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            createAccountButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension RegisterUserView {
    @objc
    func didTapRegister(){
        delegate?.didTapCreateAccount()
    }
}
