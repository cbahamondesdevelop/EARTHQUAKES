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
    
    private lazy var startDateTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textAlignment = .right
        textField.placeholder = textAPP.selectADate
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var endDateLabel: UILabel = {
        let label = UILabel()
        label.text = textAPP.endDate
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var endDateTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textAlignment = .right
        textField.placeholder = textAPP.selectADate
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    /*
    private lazy var startDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private lazy var endDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()*/
    
    private lazy var applyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
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
        //setPicker()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    func setPicker() {
        let toolbar = UIToolbar()
        let doneButton = UIBarButtonItem(title: "Listo", style: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.items = [doneButton]
        startDateTextField.inputAccessoryView = toolbar
        endDateTextField.inputAccessoryView = toolbar
        startDateTextField.inputView = startDatePicker
        endDateTextField.inputView = endDatePicker
    }*/
}

extension DateFilterView {
    
    private func buildViewHierarchy() {
        [titleLabel, startDateLabel, startDateTextField, endDateLabel, endDateTextField, applyButton].forEach(addSubview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            startDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            startDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            startDateTextField.topAnchor.constraint(equalTo: startDateLabel.bottomAnchor, constant: 10),
            startDateTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            startDateTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            endDateLabel.topAnchor.constraint(equalTo: startDateTextField.bottomAnchor, constant: 20),
            endDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            endDateTextField.topAnchor.constraint(equalTo: endDateLabel.bottomAnchor, constant: 10),
            endDateTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            endDateTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
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
        //let startDate = startDatePicker.date
        //let endDate = endDatePicker.date
        //print("presione apply button \(startDate) \(endDate)")
        
        guard let startDate = startDateTextField.text else { return }
        guard let endDate = endDateTextField.text else { return }
        //let dateFormatter = DateFormatter()
        
        //dateFormatter.dateFormat = "dd-MM-yyyy"

        //guard let initialDate = dateFormatter.date(from: startDate) else { return }
        //guard let finalDate = dateFormatter.date(from: endDate) else { return }
        
        delegate?.tapApplyFilter(startDate: startDate, endDate: endDate)
    }
    
    @objc
    private func doneButtonTapped() {
        startDateTextField.resignFirstResponder()
        endDateTextField.resignFirstResponder()
    }
}

