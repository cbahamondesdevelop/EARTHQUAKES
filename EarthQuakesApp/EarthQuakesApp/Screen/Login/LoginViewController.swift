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
    let provider = Provider(initialDate: "2023-01-01", finalDate: "2023-01-02")
    
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
            
            provider.fetchDataFromAPI { result in
                switch result {
                case .success(let response):
                    let controller = HomeViewController(viewModel: response)
                    controller.modalPresentationStyle = .fullScreen
                    self.present(controller, animated: true)
                case .failure(let error):
                    print("error \(error)")
                }
            }
            
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
        view.backgroundColor = .systemMint
        view.addSubview(loginView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension LoginViewController: LoginDelegate {
    func didTapCreateAccount() {
        let controller = RegisterUserViewController()
        navigationController?.pushViewController(controller, animated: true)
        /*
        if let url = URL(string: "shoebox:") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }*/
    }
    
    func didTapLoginContinue(user: String, pass: String) {
        makeLogin(user: user, password: pass)
    }
}
