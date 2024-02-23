//
//  DateFilterView.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 01-02-24.
//

import Foundation
import UIKit

protocol DateFilterViewDelegate: AnyObject {
    func tapApplyFilter(startDate: String, endDate: String)
}

class DateFilterView: UIView {
    
    let textAPP = TextsInTheApp()
    weak var delegate: DateFilterViewDelegate?
    private var startDate: String?
    private var endDate: String?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.titleDateFilter
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var startDateLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.startDate
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var startDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.addTarget(self, action: #selector(startDatePickerValueChanged), for: .valueChanged)
        return datePicker
    }()
    
    private lazy var endDateLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.endDate
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()

    private lazy var endDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.addTarget(self, action: #selector(endDatePickerValueChanged), for: .valueChanged)
        return datePicker
    }()
    
    private lazy var applyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 5.0
        button.isEnabled = true
        button.setTitle(textAPP.applyFilter, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapApplyButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension DateFilterView {
    
    private func buildViewHierarchy() {
        [titleLabel, startDateLabel, startDatePicker, endDateLabel, endDatePicker, applyButton].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            startDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            startDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            startDatePicker.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            startDatePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            endDateLabel.topAnchor.constraint(equalTo: startDateLabel.bottomAnchor, constant: 40),
            endDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            endDatePicker.topAnchor.constraint(equalTo: startDatePicker.bottomAnchor, constant: 20),
            endDatePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            applyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60),
            applyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            applyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            applyButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension DateFilterView {
    @objc
    func tapApplyButton() {
        let stDate = startDate ?? textAPP.initialDateDefault
        let enDate = endDate ?? textAPP.finalDateDefault
 
        delegate?.tapApplyFilter(startDate: stDate, endDate: enDate)
    }
    
    @objc 
    private func startDatePickerValueChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: startDatePicker.date)
        startDate = date
    }
    
    @objc
    private func endDatePickerValueChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: endDatePicker.date)
        endDate = date
    }
}

