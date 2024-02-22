//
//  PreRegisterView.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 21-02-24.
//

import Foundation
import UIKit

protocol PreRegisterViewDelegate: AnyObject {
    func tapUseExistingUser()
    func tapDeleteAndCreateNewUser()
}

class PreRegisterView: UIView {
    
    let textAPP = TextsInTheApp()
    weak var delegate: PreRegisterViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.infoRegister
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var informativeImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "exclamacion"))
        image.contentMode = .scaleAspectFit
        //image.frame = CGRect(x: 10, y: 10, width: 80, height: 60)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var useExistingUserButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 5.0
        button.isEnabled = true
        button.setTitle(textAPP.useExisting, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapUseExistingUser), for: .touchUpInside)
        return button
    }()
    
    private lazy var deleteAndCreateNewUserButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 5.0
        button.isEnabled = true
        button.setTitle(textAPP.deleteAndCreateNewUser, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapDeleteAndCreateNewUser), for: .touchUpInside)
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

extension PreRegisterView {
    
    private func buildViewHierarchy() {
        [titleLabel, informativeImage, useExistingUserButton, deleteAndCreateNewUserButton].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            informativeImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            informativeImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            informativeImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            informativeImage.heightAnchor.constraint(equalToConstant: 200),
            
            useExistingUserButton.bottomAnchor.constraint(equalTo: deleteAndCreateNewUserButton.topAnchor, constant: -20),
            useExistingUserButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            useExistingUserButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            useExistingUserButton.heightAnchor.constraint(equalToConstant: 40),
            
            deleteAndCreateNewUserButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            deleteAndCreateNewUserButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            deleteAndCreateNewUserButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            deleteAndCreateNewUserButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension PreRegisterView {
    @objc
    func didTapUseExistingUser() {
        delegate?.tapUseExistingUser()
    }
    
    @objc
    func didTapDeleteAndCreateNewUser() {
        delegate?.tapDeleteAndCreateNewUser()
    }
}
