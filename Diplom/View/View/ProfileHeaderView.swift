//
//  ProfileHeaderView.swift
//  Diplom
//
//  Created by M M on 8/2/23.
//

import Foundation
import UIKit
import SnapKit

final class ProfileHeaderView: UIView {

    // MARK: - Values
    private let userImageViewSize: CGFloat = 100
    private let spacing: CGFloat = 16
    private lazy var labelsLeadingSpace: CGFloat = spacing * 2 + userImageViewSize

    // MARK: - View Elements
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image1")
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = userImageViewSize / 2
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    } ()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.backgroundColor = .clear
        label.font = UIFont(name: "Inter-SemiBold", size: 14)
        label.textColor = UIColor(named: "TextColor")
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    } ()

    private let jobLabel: UILabel = {
        let label = UILabel()
        label.text = "job"
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "TextColor2")
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    } ()

    private let infoButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(named: "TextColor_Honey"), for: .normal)
        button.setTitle("Подробная информация", for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    } ()

    private let editInfoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "TextColor_Honey")
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 14)
        button.tintColor = .white
        button.setTitle("Редактировать", for: .normal)
        return button
    } ()

    private let postsButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Публикаций", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Regular", size: 14)
        button.backgroundColor = .clear
        return button
    } ()

    private let followingButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Подписок", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Regular", size: 14)
        button.backgroundColor = .clear
        return button
    } ()

    private let followersButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Подписчиков", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Regular", size: 14)
        button.backgroundColor = .clear
        return button
    } ()

    private let postsFollowersFollowingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .clear
        return stackView
    } ()

    private let newPostButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Запись", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Regular", size: 14)
        button.backgroundColor = .clear
        return button
    } ()

    private let historyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("История", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Regular", size: 14)
        button.backgroundColor = .clear
        return button
    } ()

    private let newPhotoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "photo"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Фото", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Regular", size: 14)
        button.backgroundColor = .clear
        return button
    } ()

    private let actionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .clear
        return stackView
    } ()

    private let postInfoActionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .clear
        return stackView
    } ()

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

        private func setupView() {


            postsFollowersFollowingStackView.addArrangedSubview(postsButton)
            postsFollowersFollowingStackView.addArrangedSubview(followingButton)
            postsFollowersFollowingStackView.addArrangedSubview(followersButton)

            actionsStackView.addArrangedSubview(newPostButton)
            actionsStackView.addArrangedSubview(historyButton)
            actionsStackView.addArrangedSubview(newPhotoButton)

            postInfoActionsStackView.addArrangedSubview(postsFollowersFollowingStackView)
            postInfoActionsStackView.addArrangedSubview(actionsStackView)

            let subviews = [userImageView, nameLabel, jobLabel, infoButton, editInfoButton,
            postInfoActionsStackView]
            subviews.forEach({ self.addSubview($0) })


            userImageView.snp.makeConstraints { make in
                make.top.leading.equalToSuperview().offset(spacing)
                make.size.equalTo(userImageViewSize)
            }

            nameLabel.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(labelsLeadingSpace)
                make.right.equalToSuperview().offset(-spacing)
                make.top.equalToSuperview().offset(27)
                make.height.equalTo(20)
            }

            jobLabel.snp.makeConstraints { make in
                make.leading.trailing.height.equalTo(nameLabel)
                make.top.equalTo(nameLabel.snp.bottom)
            }

            infoButton.snp.makeConstraints { make in
                make.leading.trailing.height.equalTo(nameLabel)
                make.bottom.equalTo(userImageView)
            }

            editInfoButton.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(spacing)
                make.top.equalTo(userImageView.snp.bottom).offset(20)
                make.height.equalTo(50)
                make.trailing.equalTo(nameLabel)
            }

            postInfoActionsStackView.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(spacing)
                make.top.equalTo(editInfoButton.snp.bottom).offset(20)
                make.height.equalTo(200)
                make.trailing.equalToSuperview().offset(-spacing)
            }
        }
}
