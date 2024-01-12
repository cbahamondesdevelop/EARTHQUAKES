//
//  LoginViewController.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 03-01-24.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    let textAPP = TextsInTheApp()
    
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
        let fakePass = "1234"
        
        if user == fakeUser && password == fakePass {
            let controller = HomeViewController()
            //navigationController?.pushViewController(controller, animated: true)
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true)
        } else {
            showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: textAPP.titleAlert, message: textAPP.alertContent, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: textAPP.iAgree, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert,animated: true, completion: nil)
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
