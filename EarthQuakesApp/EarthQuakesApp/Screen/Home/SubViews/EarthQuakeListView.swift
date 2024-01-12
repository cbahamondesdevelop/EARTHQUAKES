//
//  EarthQuakeListView.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 11-01-24.
//

import Foundation
import UIKit

struct Earthquake {
    let title: String
    let magnitude: Double
    let depth: Double
    let location: String
}

class EarthQuakeListView: UIView {
    
    let textAPP = TextsInTheApp()
    
    var data: [Earthquake] = [Earthquake(title: "Terremoto1", magnitude: 3.4, depth: 5.0, location: "Valdivia"),
                              Earthquake(title: "Terremoto2", magnitude: 2.2, depth: 3.0, location: "Osorno")]
    
    private lazy var earthTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        
        earthTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "myCustomCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EarthQuakeListView {
    
    private func buildViewHierarchy() {
        addSubview(earthTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            earthTableView.topAnchor.constraint(equalTo: topAnchor),
            earthTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            earthTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            earthTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension EarthQuakeListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = earthTableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? CustomTableViewCell else {
            fatalError("Error in TableView")
        }
        
        let earthquake = data[indexPath.row]
        cell.titleLabel.text = "\(textAPP.titleLabelCell)\(earthquake.title)"
        cell.magnitudeLabel.text = "\(textAPP.magnitudeLabelCell)\(earthquake.magnitude)"
        cell.depthLabel.text = "\(textAPP.depthLabelCell)\(earthquake.depth)"
        cell.locationLabel.text = "\(textAPP.locationLabelCell)\(earthquake.location)"
        
        cell.detailButton.setTitle(textAPP.detailButton, for: .normal)
        cell.detailButton.setTitleColor(.systemBlue, for: .normal)
        // cell.detailButton.addTarget(self, action: #selector(didTapDetail(_:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectItem = data[indexPath.row]
        print("Detalle del terremoto: \(selectItem.title)")
    }
}
