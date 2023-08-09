//
//  LoginViewController.swift
//  Diplom
//
//  Created by M M on 7/27/23.
//

import Foundation
import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    // MARK: - Values

    // MARK: - View Elements
    private let welcomeBackLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "TextColor_Honey")
        label.font = UIFont(name: "Inter-SemiBold", size: 18)
        label.text = "С возвращением"
        label.textAlignment = .center
        return label
    } ()

    private let enterPhoneNumberLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "TextColor")
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.text = "Введите номер телефона для входа в приложение"
        label.textAlignment = .center
        return label
    } ()

    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.textColor = UIColor(named: "AccentColor")
        textField.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
        textField.layer.borderWidth = 1
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        textField.placeholder = "+38 _ _ _ - _ _ _ - _ _"
        textField.textAlignment = .center
        return textField
    } ()

    private let submitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "AccentColor")
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        button.setTitle("ПОДТВЕРДИТЬ", for: .normal)
        button.layer.cornerRadius = 10
        return button
    } ()

    // MARK: - init

    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .white

        let subviews = [welcomeBackLabel, enterPhoneNumberLabel, phoneNumberTextField, submitButton]
        subviews.forEach({ view.addSubview($0) })

        welcomeBackLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(250)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }

        enterPhoneNumberLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(300)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(65)
            make.centerX.equalToSuperview()
        }

        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(350)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(70)
            make.centerX.equalToSuperview()
        }

        submitButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(550)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(65)
            make.centerX.equalToSuperview()
        }
    }

}
