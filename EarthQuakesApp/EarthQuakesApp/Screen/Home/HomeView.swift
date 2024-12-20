//
//  HomeView.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 11-01-24.
//

import Foundation
import UIKit

protocol HomeViewDelegate: AnyObject {
    func didTapDetail(detail: FeaturesStruct)
    func didTapSearchButton()
    func didSearch(searchText: String)
    func didLogout()
}

class HomeView: UIView {
    
    let textAPP = TextsInTheApp()
    var viewModel: EarthquakeDataResponse
    weak var delegate: HomeViewDelegate?
    
    private lazy var searchBarView: SearchHeaderView = {
        let view = SearchHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    lazy var earthQuakeListView: EarthQuakeListView = {
        let view = EarthQuakeListView(viewModel: viewModel)
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(viewModel: EarthquakeDataResponse){
        self.viewModel = viewModel
        super.init(frame: .zero)
        buildViewHierarchy()
        setupConstraints()
        backgroundColor = .white
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

extension HomeView: EarthQuakeListViewDelegate {
    func didTapDetail(detail: FeaturesStruct) {
        delegate?.didTapDetail(detail: detail)
    }
}

extension HomeView: SearchHeaderViewDelegate {
    func logoutButton() {
        delegate?.didLogout()
    }
    
    func searchBar(searchText: String) {
        delegate?.didSearch(searchText: searchText)
    }
    
    func searchButton() {
        delegate?.didTapSearchButton()
    }
}
