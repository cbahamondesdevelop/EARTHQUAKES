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
