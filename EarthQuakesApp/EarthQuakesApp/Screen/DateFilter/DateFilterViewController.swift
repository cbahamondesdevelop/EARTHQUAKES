//
//  DateFilterViewController.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 01-02-24.
//

import Foundation
import UIKit

protocol DateFilterViewControllerDelegate: AnyObject {
    func dateSelect(startDate: String, endDate: String)
}

class DateFilterViewController: UIViewController {
    
    let textAPP = TextsInTheApp()
    weak var delegate: DateFilterViewControllerDelegate?
    
    private lazy var dateFilterView: DateFilterView = {
        let view = DateFilterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierarchy()
        setupConstraints()
        overrideUserInterfaceStyle = .light
    }
}

extension DateFilterViewController {
    func buildViewHierarchy() {
        view.backgroundColor = .systemMint
        view.addSubview(dateFilterView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            dateFilterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dateFilterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dateFilterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dateFilterView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension DateFilterViewController: DateFilterViewDelegate {
    func tapApplyFilter(startDate: String, endDate: String) {
        delegate?.dateSelect(startDate: startDate, endDate: endDate)
        self.dismiss(animated: true)
    }
}
