//
//  ContactsHeaderView.swift
//  Diplom
//
//  Created by M M on 8/1/23.
//

import Foundation
import UIKit
import SnapKit

final class ContactsCell: UITableViewCell {

    // MARK: - Values
    private let buttonSize: CGFloat = 60

    // MARK: - View Elements
    private lazy var contact1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "image5"), for: .normal)
        button.layer.cornerRadius = buttonSize / 2
        button.clipsToBounds = true
        return button
    } ()

    private lazy var contact2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "image6"), for: .normal)
        button.layer.cornerRadius = buttonSize / 2
        button.clipsToBounds = true
        return button
    } ()

    private lazy var contact3: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "image8"), for: .normal)
        button.layer.cornerRadius = buttonSize / 2
        button.clipsToBounds = true
        return button
    } ()

    private lazy var contact4: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "image9"), for: .normal)
        button.layer.cornerRadius = buttonSize / 2
        button.clipsToBounds = true
        return button
    } ()

    private lazy var contact5: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "image5"), for: .normal)
        button.layer.cornerRadius = buttonSize / 2
        button.clipsToBounds = true
        return button
    } ()

    private let contactsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    } ()

    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

        private func setupView() {
            self.backgroundColor = .white
            let subviews = [contact1, contact2, contact3, contact4, contact5]
            subviews.forEach({ contactsStackView.addArrangedSubview($0) })
            self.addSubview(contactsStackView)

            contact1.snp.makeConstraints { make in
                make.height.width.equalTo(buttonSize)
            }

            contact2.snp.makeConstraints { make in
                make.height.width.equalTo(buttonSize)
            }

            contact3.snp.makeConstraints { make in
                make.height.width.equalTo(buttonSize)
            }

            contact4.snp.makeConstraints { make in
                make.height.width.equalTo(buttonSize)
            }

            contact5.snp.makeConstraints { make in
                make.height.width.equalTo(buttonSize)
            }

            contactsStackView.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.leading.trailing.equalToSuperview().inset(16)
            }
        }
}
