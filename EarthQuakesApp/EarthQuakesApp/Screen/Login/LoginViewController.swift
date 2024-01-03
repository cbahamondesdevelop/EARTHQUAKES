//
//  LoginViewController.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 03-01-24.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    //private var controllerModel: String
    
    private var loginView: LoginView = {
        let view = LoginView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierarchy()
        setupConstraints()
    }
    /*
    init(controllerModel: String) {
        self.controllerModel = controllerModel
        super.init(nibName: nil, bundle: nil)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     */
}

extension LoginViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .systemPurple
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
