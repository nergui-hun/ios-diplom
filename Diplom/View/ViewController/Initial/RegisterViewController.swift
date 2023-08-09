//
//  RegisterViewController.swift
//  Diplom
//
//  Created by M M on 7/26/23.
//

import Foundation
import UIKit
import SnapKit

final class RegisterViewController: UIViewController {

    // MARK: - Values
    private let back_image = UIImage(named: "arrow_back")

    // MARK: - View Elements

    private let registerLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "AccentColor")
        label.font = UIFont(name: "Inter-SemiBold", size: 18)
        label.text = "ЗАРЕГИСТРИРОВАТЬСЯ"
        label.textAlignment = .center
        return label
    } ()

    private let enterNumberFirstLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "TextColor1")
        label.font = UIFont(name: "Inter-Medium", size: 16)
        label.text = "Введите номер"
        label.textAlignment = .center
        return label
    } ()

    private let enterNumberSecondLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "TextColor2")
        label.font = UIFont(name: "Inter-Medium", size: 12)
        label.text = "Ваш номер будет использоваться для входа в аккаунт"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    } ()

    private let numberTextField: UITextField = {
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

    private let submitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "AccentColor")
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        button.setTitle("ДАЛЕЕ", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(submitButtonClicked), for: .touchUpInside)
        return button
    } ()

    private let termsOfUseLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "TextColor2")
        label.font = UIFont(name: "Inter-Medium", size: 12)
        label.text = "Нажимая кнопку \"Далее\" Вы принимаете Пользовательское Соглашение и Политику Конфиденциальности"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    } ()

    // MARK: - init

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        print("test")
        setupView()
        //self.navigationController?.navigationBar.topItem?.backButtonTitle = "test"
    }

    private func setupView() {
        view.backgroundColor = .white

        let subviews = [registerLabel, enterNumberFirstLabel, enterNumberSecondLabel,
                        numberTextField, submitButton, termsOfUseLabel]
        subviews.forEach({ view.addSubview( $0 )})

        registerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(160)
            make.leading.trailing.equalToSuperview().inset(80)
            make.height.equalTo(25)
        }

        enterNumberFirstLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(260)
            make.leading.trailing.equalToSuperview().inset(80)
            make.height.equalTo(25)
        }

        enterNumberSecondLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(290)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }

        numberTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(350)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(55)
        }

        submitButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(460)
            make.leading.trailing.equalToSuperview().inset(80)
            make.height.equalTo(60)
        }

        termsOfUseLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(530)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(100)
        }
    }

    @objc func submitButtonClicked() {
        let registerConfirmVC = RegisterConfirmViewController()
        self.navigationController?.pushViewController(registerConfirmVC, animated: true)
    }

}
