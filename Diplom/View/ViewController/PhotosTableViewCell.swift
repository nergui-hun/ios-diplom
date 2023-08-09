//
//  PhotosTableViewCell.swift
//  Diplom
//
//  Created by M M on 8/4/23.
//

import Foundation
import UIKit
import SnapKit

protocol PhotosTableViewCellDelegate: AnyObject {
    func redirectToGalleryAction()
}

final class PhotosTableViewCell: UITableViewCell {

    // MARK: - Values
    weak var delegate: PhotosTableViewCellDelegate?

    // MARK: - View Elements

    private let photosLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var photosButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.right"), for: UIControl.State.normal)
        button.tintColor = .black
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.addTarget(self, action: #selector(redirectToGalleryAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let thirdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let fourthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let fifthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    @objc func redirectToGalleryAction(_ sender: Any) {
        delegate?.redirectToGalleryAction()
    }

    private func setupView() {
        let subviews = [photosLabel, photosButton, firstImageView, secondImageView, thirdImageView, fourthImageView, fifthImageView]
        subviews.forEach({ addSubview($0)})
        let imageSize = (UIScreen.main.bounds.width - 48) / 4

        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            photosLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            photosLabel.widthAnchor.constraint(equalToConstant: 150),
            photosLabel.bottomAnchor.constraint(equalTo: firstImageView.topAnchor, constant: -12),

            photosButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            photosButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
            photosButton.widthAnchor.constraint(equalToConstant: 30),
            photosButton.bottomAnchor.constraint(equalTo: firstImageView.topAnchor, constant: -12),

            firstImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            firstImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            firstImageView.heightAnchor.constraint(equalToConstant: imageSize),
            firstImageView.widthAnchor.constraint(equalToConstant: imageSize),
            firstImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),

            secondImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            secondImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: imageSize + 20),
            secondImageView.heightAnchor.constraint(equalToConstant: imageSize),
            secondImageView.widthAnchor.constraint(equalToConstant: imageSize),
            secondImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),

            thirdImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            thirdImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: imageSize * 2 + 28),
            thirdImageView.heightAnchor.constraint(equalToConstant: imageSize),
            thirdImageView.widthAnchor.constraint(equalToConstant: imageSize),
            thirdImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),

            fourthImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            fourthImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: imageSize * 3 + 36),
            fourthImageView.heightAnchor.constraint(equalToConstant: imageSize),
            fourthImageView.widthAnchor.constraint(equalToConstant: imageSize),
            fourthImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),

            fifthImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            fifthImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: imageSize * 4 + 42),
            fifthImageView.heightAnchor.constraint(equalToConstant: imageSize),
            fifthImageView.widthAnchor.constraint(equalToConstant: imageSize),
            fifthImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
        ])
    }

    func setup() {
        self.firstImageView.image = UIImage(named: "image1")
        self.secondImageView.image = UIImage(named: "image2")
        self.thirdImageView.image = UIImage(named: "image3")
        self.fourthImageView.image = UIImage(named: "image4")
        self.fifthImageView.image = UIImage(named: "image5")
    }
}
