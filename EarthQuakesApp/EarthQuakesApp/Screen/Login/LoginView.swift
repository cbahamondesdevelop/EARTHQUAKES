//
//  LoginView.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 03-01-24.
//

import Foundation
import UIKit

protocol LoginDelegate: AnyObject {
    func didTapLoginContinue(user: String, pass: String)
    func didTapCreateAccount()
}

class LoginView: UIView {
    
    let textAPP = TextsInTheApp()
    weak var delegate: LoginDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.welcome
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var userLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.nameUser
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var userTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = textAPP.nameUser
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
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle(textAPP.createAccount, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 5.0
        button.isEnabled = true
        button.setTitle(textAPP.titleButton, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
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

extension LoginView {
    
    private func buildViewHierarchy() {
        [titleLabel, userLabel, userTextField, passwordLabel, passwordTextField, registerButton, loginButton].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            userLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            userLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                        
            userTextField.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 10),
            userTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            passwordLabel.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                        
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            registerButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -15),
            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            loginButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension LoginView {
    @objc
    func didTapLogin() {
        guard let user = userTextField.text else { return }
        guard let pass = passwordTextField.text else { return }
        
        delegate?.didTapLoginContinue(user: user, pass: pass)
    }
    
    @objc
    func didTapRegister(){
        delegate?.didTapCreateAccount()
    }
}
