//
//  HomeTableViewCell.swift
//  Diplom
//
//  Created by M M on 7/27/23.
//

import Foundation
import UIKit
import SnapKit

final class HomeTableViewCell: UITableViewCell {

    // MARK: - Values
    private let userImageViewSize: CGFloat = 50
    private let manager = ConstraintManager()

    var viewModel: HomeTableVM? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {
                print("HomeTableViewCell | viewModel | no viewModel")
                return
            }

            userImageView.image = UIImage(named: viewModel.userImage)
            nameLabel.text = viewModel.userName
            jobLabel.text = viewModel.userJob
            postTextLabel.text = viewModel.postText
            postImageView.image = UIImage(named: viewModel.postImage)
            likeNumberLabel.text = "\(viewModel.likes)"
            commentNumberLabel.text = "\(viewModel.comments)"
        }
    }

    // MARK: - View Elements
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = userImageViewSize / 2
        imageView.clipsToBounds = true
        return imageView
    } ()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = UIColor(named: "TextColor")
        label.font = UIFont(name: "Inter-SemiBold", size: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    } ()

    private let jobLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "TextColor2")
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    } ()

    private let detailsButton: UIButton = {
        let button = UIButton()
        let threeDotsImage = UIImage(systemName: "ellipsis")
        button.setImage(threeDotsImage, for: .normal)
        button.tintColor = UIColor(named: "TextColorHoney")
        return button
    } ()

    private let nameJobStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fillProportionally
            return stackView
    } ()

    private let postTextLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "AccentColor")
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.numberOfLines = 4
        label.textAlignment = .left
        label.showsExpansionTextWhenTruncated = true
        return label
    } ()

    private let showMoreButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 14)
        button.setTitle("Показать полностью...", for: .normal)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(showMoreButtonAction), for: .touchUpInside)
        return button
    } ()

    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    } ()

    // postTextLabel, showMoreButton, postImageView
    private let postTextButtonImageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    } ()


    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "like"), for: .normal)
        button.contentHorizontalAlignment = .right
        return button
    } ()

    private let likeNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    } ()

    private let commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "comment"), for: .normal)
        button.contentHorizontalAlignment = .right
        return button
    } ()

    private let commentNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    } ()

    // likeButton, likeNumberLabel, commentButton, commentNumberLabel
    private let likeCommentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    } ()


    private let saveButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "save"), for: .normal)
        button.contentHorizontalAlignment = .right
        return button
    } ()

    //like, comment, save
    private let likeCommentSaveStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    } ()

    private let postStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor(named: "BackgroundColor")
        return stackView
    } ()


    /*private let separator: UIView = {
        let separator = UIView(frame: .zero)
        separator.backgroundColor = UIColor(named: "AccentColor")
        return separator
    } ()*/

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

            nameJobStackView.addArrangedSubview(nameLabel)
            nameJobStackView.addArrangedSubview(jobLabel)

            postTextButtonImageStackView.addArrangedSubview(postTextLabel)
            postTextButtonImageStackView.addArrangedSubview(showMoreButton)
            postTextButtonImageStackView.addArrangedSubview(postImageView)

            likeCommentStackView.addArrangedSubview(likeButton)
            likeCommentStackView.addArrangedSubview(likeNumberLabel)
            likeCommentStackView.addArrangedSubview(commentButton)
            likeCommentStackView.addArrangedSubview(commentNumberLabel)

            likeCommentSaveStackView.addArrangedSubview(likeCommentStackView)
            likeCommentSaveStackView.addArrangedSubview(saveButton)

            postStackView.addArrangedSubview(postTextButtonImageStackView)
            postStackView.addArrangedSubview(likeCommentSaveStackView)

            let subviews = [userImageView, nameJobStackView, detailsButton, postStackView]
            subviews.forEach({ self.contentView.addSubview($0) })
            setupUserInfoStackView()

            postStackView.snp.makeConstraints { make in
                make.top.equalTo(userImageView.snp_bottomMargin).offset(16)
                make.bottom.leading.trailing.equalToSuperview()
            }

            setupPostTextButtonImageStackView()
            setupLikeCommentSaveStackView()
        }

    private func setupUserInfoStackView() {

        userImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(16)
            make.height.width.equalTo(userImageViewSize)
        }

        nameJobStackView.snp.makeConstraints { make in
            make.top.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp_trailingMargin).offset(16)
            make.height.equalTo(userImageView)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }

        jobLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
        }

        detailsButton.snp.makeConstraints { make in
            make.top.bottom.equalTo(userImageView)
            make.trailing.equalToSuperview()
            make.width.equalTo(50)
        }
    }

    private func setupPostTextButtonImageStackView() {
        let postTextLabelHeight: CGFloat = 70
        let showMoreButtonHeight: CGFloat = 30
        let postImageViewHeight: CGFloat = 70

        let elements = [postImageViewHeight, showMoreButtonHeight, postImageViewHeight]
        let stackHeight = manager.getVerticalStackViewHeight(heightArray: elements)

        postTextLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(postTextLabelHeight)
        }

        showMoreButton.snp.makeConstraints { make in
            make.top.equalTo(postTextLabel.snp_bottomMargin)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }

        postImageView.snp.makeConstraints { make in
            make.top.equalTo(showMoreButton.snp_bottomMargin)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(70)
        }

        postTextButtonImageStackView.snp.makeConstraints { make in
            make.top.equalTo(showMoreButton.snp_bottomMargin)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(stackHeight)
        }
    }

    private func setupLikeCommentSaveStackView() {

        let likeCommentElementWidth: CGFloat = 50

        let elements = [likeCommentElementWidth, likeCommentElementWidth, likeCommentElementWidth, likeCommentElementWidth]
        let likeCommentStackViewWidth = manager.getHorizontalStackViewWidth(widthArray: elements)

        likeButton.snp.makeConstraints { make in
            make.top.height.leading.equalToSuperview()
            make.width.equalTo(50)
        }

        likeNumberLabel.snp.makeConstraints { make in
            make.top.height.equalToSuperview()
            make.leading.equalTo(likeButton.snp_trailingMargin)
            make.width.equalTo(50)
        }

        commentButton.snp.makeConstraints { make in
            make.top.height.equalToSuperview()
            make.leading.equalTo(likeNumberLabel.snp_trailingMargin)
            make.width.equalTo(50)
        }

        commentNumberLabel.snp.makeConstraints { make in
            make.top.height.equalToSuperview()
            make.leading.equalTo(commentButton.snp_trailingMargin)
            make.width.equalTo(50)
        }

        saveButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().offset(16)
            make.width.equalTo(50)
        }

        likeCommentStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
        }

        likeCommentSaveStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }
    

    @objc func showMoreButtonAction() {

    }
}
