//
//  EarthQuakesDetailView.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 25-01-24.
//

import Foundation
import UIKit
import MapKit

protocol EarthQuakesDetailViewDelegate: AnyObject {
    func closeModal()
}

class EarthQuakesDetailView: UIView {
    
    let textAPP = TextsInTheApp()
    var viewModel: FeaturesStruct
    var delegate: EarthQuakesDetailViewDelegate?
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.properties.title
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.properties.place
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var magnitudeLabel: UILabel = {
        let label = UILabel()
        label.text = String(viewModel.properties.mag ?? 0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var depthLabel: UILabel = {
        let label = UILabel()
        label.text = String(viewModel.geometry.coordinates[2])
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    func setCoordinates(coordinates: [Double]) {
        let location = CLLocationCoordinate2D(latitude: coordinates[1], longitude: coordinates[0])
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        mapView.addAnnotation(annotation)
    }
    
    @objc
    func didTapClose() {
        delegate?.closeModal()
    }
    
    init(frame: CGRect = .zero, viewModel: FeaturesStruct) {
        self.viewModel = viewModel
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        setCoordinates(coordinates: viewModel.geometry.coordinates)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EarthQuakesDetailView {
    
    private func buildViewHierarchy() {
        [closeButton, titleLabel, locationLabel, magnitudeLabel, depthLabel, mapView].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            locationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            magnitudeLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            magnitudeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            depthLabel.topAnchor.constraint(equalTo: magnitudeLabel.bottomAnchor, constant: 10),
            depthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            mapView.topAnchor.constraint(equalTo: depthLabel.bottomAnchor, constant: 10),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
