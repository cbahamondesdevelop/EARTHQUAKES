//
//  LoginView.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 03-01-24.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    //let loginModel: String
    
    private lazy var userLabel: UILabel = {
        let label = UILabel()
        label.text = "Nombre usuario"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var userTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nombre usuario"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    
    private func buildViewHierarchy() {
        addSubview(userLabel)
        // addSubview(userTextField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            userLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            userLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
