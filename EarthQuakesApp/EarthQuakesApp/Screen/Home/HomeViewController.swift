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
    let textAPP = TextsInTheApp()
    
    private lazy var homeView: HomeView = {
        let view = HomeView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.earthQuakeListView.earthTableView.dataSource = self
        view.earthQuakeListView.earthTableView.delegate = self
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
    func didSearch(searchText: String) {
        search(searchText: searchText)
    }
    
    func didTapSearchButton() {
        let controller = DateFilterViewController()
        controller.delegate = self
        controller.modalPresentationStyle = .formSheet
        self.present(controller, animated: true)
    }
    
    func didTapDetail(detail: FeaturesStruct) {
        let controller = EarthQuakesDetailViewController(viewModel: detail)
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
}

extension HomeViewController: DateFilterViewControllerDelegate {
    func dateSelect(startDate: String, endDate: String) {
        callServiceAgain(startDate: startDate, finalDate: endDate)
    }
    
    func callServiceAgain(startDate: String, finalDate: String) {
        let provider = Provider(initialDate: startDate, finalDate: finalDate)
        
        provider.fetchDataFromAPI { result in
            switch result {
            case .success(let response):
                self.viewModel = response
                self.homeView.earthQuakeListView.filteredData = response.features
                self.homeView.earthQuakeListView.earthTableView.reloadData()
            case .failure(let error):
                print("error \(error)")
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeView.earthQuakeListView.filteredData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeView.earthQuakeListView.earthTableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? CustomTableViewCell else {
            fatalError("Error in TableView")
        }
        
        let earthquake = homeView.earthQuakeListView.filteredData?[indexPath.row]
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
        guard let selectItem = homeView.earthQuakeListView.filteredData?[indexPath.row] else { return }
        didTapDetail(detail: selectItem)
    }
    
    func search(searchText: String) {
        homeView.earthQuakeListView.filteredData = []
        
        if searchText == textAPP.emptyDefault {
            homeView.earthQuakeListView.filteredData = viewModel.features
        }
        
        for item in viewModel.features {
            if item.properties.title.uppercased().contains(searchText.uppercased()) {
                homeView.earthQuakeListView.filteredData?.append(item)
            }
        }
        
        homeView.earthQuakeListView.earthTableView.reloadData()
    }
}
