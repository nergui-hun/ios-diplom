//
//  ProfileViewController.swift
//  Diplom
//
//  Created by M M on 7/27/23.
//

import Foundation
import UIKit
import SnapKit

class ProfileViewController: UIViewController {


    // MARK: - Values
    private let viewModel: HomeVMProtocol?

    // MARK: - View Elements
    private let headerView = ProfileHeaderView()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "postCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "photosCell")

        tableView.sectionFooterHeight = 0
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.tableHeaderView = headerView

        return tableView
    } ()
    
    // MARK: - init
    init(viewModel: HomeVMProtocol?) {
        self.viewModel = viewModel
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

            view.addSubview(tableView)

            tableView.snp.makeConstraints { make in
                make.top.bottom.leading.trailing.equalToSuperview()
            }

            headerView.snp.makeConstraints { make in
                make.width.equalTo(tableView)
                make.height.equalTo(450)
            }

            self.tableView.tableHeaderView?.layoutIfNeeded()
        }
}


extension ProfileViewController: UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            guard let count = try? viewModel?.numberOfRows() else { preconditionFailure("homeVC | No posts") }
            return count
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? HomeTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
                return cell
            }
            cell.viewModel = viewModel?.cellVM(forIndexPath: indexPath)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "photosCell", for: indexPath) as? PhotosTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
                return cell
            }
            cell.delegate = self
            cell.setup()

            let redirectTap = UITapGestureRecognizer(target: self, action: #selector(redirectToGalleryAction))
            cell.addGestureRecognizer(redirectTap)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ProfileViewController: PhotosTableViewCellDelegate {
    @objc func redirectToGalleryAction() {
        let photosViewController = PhotosViewController()
        self.navigationController?.pushViewController(photosViewController, animated: true)
    }
}

