//
//  RegisterUserViewController.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 11-01-24.
//

import Foundation
import UIKit

class RegisterUserViewController: UIViewController {
    
    let textAPP = TextsInTheApp()
    
    private lazy var registerUserView: RegisterUserView = {
        let view = RegisterUserView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierarchy()
        setupConstraints()
        overrideUserInterfaceStyle = .light
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(myDismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: textAPP.titleAlert, message: textAPP.alertPass, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: textAPP.iAgree, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert,animated: true, completion: nil)
    }
    
    @objc
    func myDismissKeyboard() {
        view.endEditing(true)
    }
}

extension RegisterUserViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .systemMint
        view.addSubview(registerUserView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            registerUserView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registerUserView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            registerUserView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            registerUserView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension RegisterUserViewController: RegisterUserViewDelegate {
    func didTapCreateAccount(userData: UserAppModel) {
        if userData.password == userData.repeatPassword {
            let encoder = JSONEncoder()
            if let jsonData = try? encoder.encode(userData){
                UserDefaults.standard.set(jsonData, forKey: "userRegister")
            }
            self.navigationController?.popViewController(animated: true)
        } else {
            showAlert()
        }
    }
}
