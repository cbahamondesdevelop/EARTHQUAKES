//
//  LoginViewController.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 03-01-24.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierarchy()
        setupConstraints()
    }
    
    func makeLogin(user: String, password: String) {
        let fakeUser = "Cristian"
        let fakePass = "123456"
        
        if user == fakeUser && password == fakePass {
            
        } else {
            print("NO LOGIN")
        }
    }
}

extension LoginViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .white
        view.addSubview(loginView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension LoginViewController: LoginDelegate {
    func didTapCreateAccount() {
        let controller = RegisterUserViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func didTapLoginContinue(user: String, pass: String) {
        makeLogin(user: user, password: pass)
    }
}
