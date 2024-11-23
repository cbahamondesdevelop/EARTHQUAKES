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
        overrideUserInterfaceStyle = .light
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(myDismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func makeLogin(user: String, password: String) {
        let userOK = validateUser(name: user, inPass: password)
        if userOK {
            
            provider.fetchDataFromAPI { result in
                switch result {
                case .success(let response):
                    self.loginView.spinnerView.stopAnimating()
                    let controller = HomeViewController(viewModel: response)
                    controller.modalPresentationStyle = .fullScreen
                    self.present(controller, animated: true)
                case .failure(let error):
                    print("error \(error)")
                }
            }
            
        } else {
            loginView.spinnerView.stopAnimating()
            showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: textAPP.titleAlert, message: textAPP.alertUserOrPass, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: textAPP.iAgree, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert,animated: true, completion: nil)
    }
    
    func validateUser(name: String, inPass: String) -> Bool {
        let decoder = JSONDecoder()
        
        if let userData = UserDefaults.standard.object(forKey: "userRegister") as? Data {
            do {
                let user = try decoder.decode(UserAppModel.self, from: userData)
                if name == user.name && inPass == user.password {
                    return true
                } else {
                    return false
                }
            } catch {
                print("Error")
                return false
            }
        } else {
            print("No existe data")
            return false
        }
    }
    
    func userExists() -> Bool {
        let decoder = JSONDecoder()
        
        if let userData = UserDefaults.standard.object(forKey: "userRegister") as? Data {
            do {
                let user = try decoder.decode(UserAppModel.self, from: userData)
                if user.name != textAPP.emptyDefault {
                    return true
                } else {
                    return false
                }
            } catch {
                print("Error")
                return false
            }
        } else {
            print("No existe data")
            return false
        }
    }
    
    @objc
    func myDismissKeyboard() {
        view.endEditing(true)
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
        
        if userExists() {
            let controller = PreRegisterViewController()
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = RegisterUserViewController()
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func didTapLoginContinue(user: String, pass: String) {
        makeLogin(user: user, password: pass)
    }
}
