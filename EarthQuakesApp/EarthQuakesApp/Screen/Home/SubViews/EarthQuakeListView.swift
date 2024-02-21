//
//  EarthQuakeListView.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 11-01-24.
//

import Foundation
import UIKit

protocol EarthQuakeListViewDelegate: AnyObject {
    func didTapDetail(detail: FeaturesStruct)
}

class EarthQuakeListView: UIView {
    
    let textAPP = TextsInTheApp()
    var viewModel: EarthquakeDataResponse
    var filteredData: [FeaturesStruct]?
    weak var delegate: EarthQuakeListViewDelegate?
    
    lazy var earthTableView: UITableView = {
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
        
        filteredData = viewModel.features
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
        return filteredData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = earthTableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? CustomTableViewCell else {
            fatalError("Error in TableView")
        }
        
        let earthquake = filteredData?[indexPath.row]
        cell.titleLabel.text = textAPP.titleLabelCell
        cell.subTitleLabel.text = earthquake?.properties.title ?? textAPP.emptyDefault
        cell.magnitudeLabel.text = "\(textAPP.magnitudeLabelCell)\(earthquake?.properties.mag ?? 0)"
        cell.depthLabel.text = "\(textAPP.depthLabelCell)\(String(describing: earthquake?.geometry.coordinates[2]))"
        cell.locationLabel.text = "\(textAPP.locationLabelCell)\(earthquake?.properties.place ?? textAPP.emptyLocation)"
        
        cell.detailButton.setTitle(textAPP.detailButton, for: .normal)
        cell.detailButton.setTitleColor(.systemBlue, for: .normal)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectItem = filteredData?[indexPath.row] else { return }
        delegate?.didTapDetail(detail: selectItem)
    }
    
    func search(searchText: String) {
        filteredData = []
        
        if searchText == textAPP.emptyDefault {
            filteredData = viewModel.features
        }
        
        for item in viewModel.features {
            if item.properties.title.uppercased().contains(searchText.uppercased()) {
                filteredData?.append(item)
            }
        }
        
        earthTableView.reloadData()
    }
}
