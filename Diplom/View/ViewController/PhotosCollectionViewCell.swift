//
//  PhotosCollectionViewCell.swift
//  Diplom
//
//  Created by M M on 8/4/23.
//

import Foundation
import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {

    // MARK: - Values

    // MARK: - View Elements
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
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

            self.contentView.addSubview(photoImageView)

            photoImageView.snp.makeConstraints { make in
                make.top.bottom.leading.trailing.equalTo(self.contentView)
            }
        }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.photoImageView.image = nil
    }

    func setup(with image: String) {
        self.photoImageView.image = UIImage(named: image)
    }





}
