//
//  HomeViewController.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 11-01-24.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    private var viewModel: EarthquakeDataResponse
    
    private lazy var homeView: HomeView = {
        let view = HomeView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierarchy()
        setupConstraints()
    }
    
    init(viewModel: EarthquakeDataResponse) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        print(viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .white
        view.addSubview(homeView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeView.topAnchor.constraint(equalTo: view.topAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension HomeViewController: HomeViewDelegate {
    func didTapDetail(detail: FeaturesStruct) {
        //let controller = EarthQuakesDetailViewController()
        //navigationController?.pushViewController(controller, animated: true)
        
        let controller = EarthQuakesDetailViewController(viewModel: detail)
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
}
