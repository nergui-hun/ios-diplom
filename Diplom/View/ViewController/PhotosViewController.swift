//
//  PhotosViewController.swift
//  Diplom
//
//  Created by M M on 8/4/23.
//

import Foundation
import UIKit
import SnapKit
import PhotosUI

final class PhotosViewController: UIViewController {

    // MARK: - Values
    private var dataSource: [String] = []

    // MARK: - View Elements
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "defaultCell")
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "photoCell")
        return collection
    } ()

    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        return layout
    } ()

    private lazy var addButton: UIBarButtonItem = {
       let button = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
        button.tintColor = UIColor(named: "TextColor_Honey")
        return button
    } ()
    

    // MARK: - init

    // MARK: - Methods
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Фотографии"
            setupView()
            dataSource = fetchData()
        }

        private func setupView() {

            view.addSubview(collectionView)
            self.navigationItem.rightBarButtonItem = addButton

            collectionView.snp.makeConstraints { make in
                make.top.bottom.leading.trailing.equalTo(view).inset(8)
            }
        }

    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let neededWidth = width - 2 * spacing
        let itemWidth = floor(neededWidth / 3)
        return CGSize(width: itemWidth, height: itemWidth)
    }

    private func fetchData() -> [String] {
        (1...20).map { String("image\($0)")}
    }

    @objc func addButtonTapped() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 4
        configuration.filter = .images

        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }

}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return 1
        } else {
            return 20
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as?
                PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "defaultCell", for: indexPath)
            return cell
        }
        let photo = self.dataSource[indexPath.row]
        cell.setup(with: photo)
        return cell
    }

}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }
}

extension PhotosViewController: PHPickerViewControllerDelegate, UINavigationControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {

        if let itemProvider = results.first?.itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in

                DispatchQueue.main.async {
                    guard let self = self else { return }

                    if let image = image as? UIImage {
                        //self.collectionView.im
                        picker.dismiss(animated: false, completion: nil)
                    }
                }
            }
        }
    }

   // cancel
}
