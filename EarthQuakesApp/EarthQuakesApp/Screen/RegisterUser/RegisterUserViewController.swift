//
//  RegisterUserViewController.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 11-01-24.
//

import Foundation
import UIKit

class RegisterUserViewController: UIViewController {
    
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
    }
}

extension RegisterUserViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .white
        view.addSubview(registerUserView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            registerUserView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registerUserView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            registerUserView.topAnchor.constraint(equalTo: view.topAnchor),
            registerUserView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension RegisterUserViewController: RegisterUserViewDelegate {
    func didTapCreateAccount() {
        // will be implemented in the near future
    }
}
