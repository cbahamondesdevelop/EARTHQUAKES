//
//  TableViewCell.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 11-01-24.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .purple
        label.numberOfLines = 0
        return label
    }()
    
    lazy var magnitudeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var depthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTableViewCell {
    
    private func buildViewHierarchy() {
        [titleLabel, magnitudeLabel, depthLabel, locationLabel, detailButton].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            magnitudeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            magnitudeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            depthLabel.topAnchor.constraint(equalTo: magnitudeLabel.bottomAnchor, constant: 7),
            depthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            locationLabel.topAnchor.constraint(equalTo: depthLabel.bottomAnchor, constant: 7),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            //locationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 7),
            
            detailButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            detailButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            detailButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
