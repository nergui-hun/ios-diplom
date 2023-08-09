//
//  InitialVC.swift
//  Diplom
//
//  Created by M M on 7/25/23.
//

import Foundation
import UIKit
import SnapKit

final class InitialViewController: UIViewController {

    // MARK: - Values
    let parentCoordinator: InitialCoordinatorProtocol

    // MARK: - View Elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "initial")
        return imageView
    } ()

    private let registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "AccentColor")
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        button.setTitle("ЗАРЕГИСТРИРОВАТЬСЯ", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        return button
    } ()

    private let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitleColor(UIColor(named: "TextColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Regular", size: 14)
        button.setTitle("Уже есть аккаунт", for: .normal)
        button.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        return button
    } ()

    // MARK: - init
    init(parentCoordinator: InitialCoordinatorProtocol) {
        self.parentCoordinator = parentCoordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .white

        setupNavBar()

        let subviews = [imageView, registerButton, loginButton]
        subviews.forEach({ view.addSubview( $0 )})

        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(144)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(344)
        }

        registerButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(568)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(47)
        }

        loginButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(655)
            make.leading.trailing.equalToSuperview().inset(75)
            make.height.equalTo(20)
        }

    }

    private func setupNavBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.backgroundColor = .clear

        self.navigationController?.navigationBar.topItem?.backButtonTitle = "Back"
    }

    @objc func registerButtonAction() {
        parentCoordinator.openRegisterVC(navcon: self.navigationController!)
    }

    @objc func loginButtonAction() {
        parentCoordinator.openLoginVC(navcon: self.navigationController!)
    }
}

// MARK: - Extensions
