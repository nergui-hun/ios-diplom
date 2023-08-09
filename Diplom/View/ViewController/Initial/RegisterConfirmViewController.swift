//
//  RegisterConfirmViewController.swift
//  Diplom
//
//  Created by M M on 7/27/23.
//

import Foundation
import UIKit
import SnapKit

final class RegisterConfirmViewController: UIViewController {

    // MARK: - Values

    // MARK: - View Elements
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "TextColor_Honey")
        label.font = UIFont(name: "Inter-SemiBold", size: 18)
        label.text = "Подтверждение регистрации"
        label.textAlignment = .center
        return label
    } ()

    private let infoLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "TextColor")
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.text = "Мы отправили SMS с кодом на номер"
        label.textAlignment = .center
        return label
    } ()

    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "AccentColor")
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.text = "+38 099 999 99 99"
        label.textAlignment = .center
        return label
    } ()


    private let smsCodeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "TextColor2")
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.text = "Введите код из SMS"
        label.textAlignment = .left
        return label
    } ()

    private let codeTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.textColor = UIColor(named: "AccentColor")
        textField.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
        textField.layer.borderWidth = 1
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        textField.placeholder = "_ _ _ - _ _ _ - _ _"
        textField.textAlignment = .center
        return textField
    } ()

    private let registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "AccentColor")
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        button.setTitle("ЗАРЕГИСТРИРОВАТЬСЯ", for: .normal)
        button.layer.cornerRadius = 10
        return button
    } ()

    private let checkmarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "checkmark")
        return imageView
    } ()

    // MARK: - init

    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .white
        self.navigationItem.backBarButtonItem?.image = UIImage(named: "left_arrow")

        let subviews = [titleLabel, infoLabel, phoneNumberLabel, smsCodeLabel,
                        codeTextField, registerButton, checkmarkImageView]
        subviews.forEach({ view.addSubview( $0 )})

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(170)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(30)
        }

        infoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(30)
        }

        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(240)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(30)
        }

        smsCodeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(380)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(30)
        }

        codeTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(410)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(65)
        }

        registerButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(530)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(65)
        }

        checkmarkImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(630)
            make.centerX.equalToSuperview()
            make.width.equalTo(86)
            make.height.equalTo(100)
        }
    }

}
