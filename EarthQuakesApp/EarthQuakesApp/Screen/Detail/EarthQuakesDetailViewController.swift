//
//  EarthQuakesDetailViewController.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 25-01-24.
//

import Foundation
import UIKit

class EarthQuakesDetailViewController: UIViewController {
    
    let textAPP = TextsInTheApp()
    var viewModel: FeaturesStruct
    
    private lazy var detailView: EarthQuakesDetailView = {
        let view = EarthQuakesDetailView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierarchy()
        setupConstraints()
    }
    
    init(viewModel: FeaturesStruct) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EarthQuakesDetailViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .white
        view.addSubview(detailView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension EarthQuakesDetailViewController: EarthQuakesDetailViewDelegate {
    func closeModal() {
        self.dismiss(animated: true)
    }
}
