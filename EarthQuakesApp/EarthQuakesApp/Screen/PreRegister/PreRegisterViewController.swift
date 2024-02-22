//
//  PreRegisterViewController.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 21-02-24.
//

import Foundation
import UIKit

class PreRegisterViewController: UIViewController {
    
    let textAPP = TextsInTheApp()
    
    private lazy var preRegisterUserView: PreRegisterView = {
        let view = PreRegisterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierarchy()
        setupConstraints()
        overrideUserInterfaceStyle = .light
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !userExists() {
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: textAPP.titleAlert, message: textAPP.alertPass, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: textAPP.iAgree, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert,animated: true, completion: nil)
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
}

extension PreRegisterViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .systemMint
        view.addSubview(preRegisterUserView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            preRegisterUserView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            preRegisterUserView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            preRegisterUserView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            preRegisterUserView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension PreRegisterViewController: PreRegisterViewDelegate {
    func tapUseExistingUser() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tapDeleteAndCreateNewUser() {
        UserDefaults.standard.removeObject(forKey: "userRegister")
        let controller = RegisterUserViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
