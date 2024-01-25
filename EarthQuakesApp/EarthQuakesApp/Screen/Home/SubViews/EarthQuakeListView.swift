//
//  EarthQuakeListView.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 11-01-24.
//

import Foundation
import UIKit

class EarthQuakeListView: UIView {
    
    let textAPP = TextsInTheApp()
    let viewModel: EarthquakeDataResponse
    
    private lazy var earthTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        return table
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: EarthquakeDataResponse){
        self.viewModel = viewModel
        super.init(frame: .zero)
        buildViewHierarchy()
        setupConstraints()
        
        earthTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "myCustomCell")
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
        return viewModel.features.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = earthTableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? CustomTableViewCell else {
            fatalError("Error in TableView")
        }
        
        let earthquake = viewModel.features[indexPath.row]
        cell.titleLabel.text = "\(textAPP.titleLabelCell)\(earthquake.properties.title)"
        cell.magnitudeLabel.text = "\(textAPP.magnitudeLabelCell)\(earthquake.properties.mag ?? 0)"
        cell.depthLabel.text = "\(textAPP.depthLabelCell)\("earthquake.depth")"
        cell.locationLabel.text = "\(textAPP.locationLabelCell)\(earthquake.properties.place ?? textAPP.emptyLocation)"
        
        cell.detailButton.setTitle(textAPP.detailButton, for: .normal)
        cell.detailButton.setTitleColor(.systemBlue, for: .normal)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectItem = viewModel.features[indexPath.row]
        print("Detalle del terremoto: \(selectItem.properties.title)")
    }
}
