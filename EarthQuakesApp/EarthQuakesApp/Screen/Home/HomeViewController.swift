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
        overrideUserInterfaceStyle = .light
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(myDismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    init(viewModel: EarthquakeDataResponse) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        print(viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func myDismissKeyboard() {
        view.endEditing(true)
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
    func didTapSearchButton() {
        let controller = DateFilterViewController()
        controller.delegate = self
        controller.modalPresentationStyle = .pageSheet
        self.present(controller, animated: true)
    }
    
    func didTapDetail(detail: FeaturesStruct) {
        //let controller = EarthQuakesDetailViewController()
        //navigationController?.pushViewController(controller, animated: true)
        
        let controller = EarthQuakesDetailViewController(viewModel: detail)
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
}

extension HomeViewController: DateFilterViewControllerDelegate {
    func dateSelect(startDate: String, endDate: String) {
        print("FECHA 1: \(startDate)")
        print("FECHA 2: \(endDate)")
        callServiceAgain(startDate: startDate, finalDate: endDate)
    }
    
    func callServiceAgain(startDate: String, finalDate: String) {
        let provider = Provider(initialDate: startDate, finalDate: finalDate)
        
        provider.fetchDataFromAPI { result in
            switch result {
            case .success(let response):
                let view = HomeView(viewModel: response)
                view.earthQuakeListView.viewModel = response
                view.earthQuakeListView.filteredData = response.features
                view.earthQuakeListView.earthTableView.reloadData()
            case .failure(let error):
                print("error \(error)")
            }
        }
    }
}
