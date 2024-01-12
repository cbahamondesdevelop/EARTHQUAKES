//
//  HomeView.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 11-01-24.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    let textAPP = TextsInTheApp()
    var viewModel: EarthquakeDataResponse
    
    private lazy var searchBarView: SearchHeaderView = {
        let view = SearchHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var earthQuakeListView: EarthQuakeListView = {
        let view = EarthQuakeListView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(viewModel: EarthquakeDataResponse){
        self.viewModel = viewModel
        super.init(frame: .zero)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView {
    
    private func buildViewHierarchy() {
        [searchBarView, earthQuakeListView].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBarView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            searchBarView.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBarView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            earthQuakeListView.leadingAnchor.constraint(equalTo: leadingAnchor),
            earthQuakeListView.trailingAnchor.constraint(equalTo: trailingAnchor),
            earthQuakeListView.topAnchor.constraint(equalTo: searchBarView.topAnchor, constant: 110),
            earthQuakeListView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
