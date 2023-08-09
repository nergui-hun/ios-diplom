//
//  ViewController.swift
//  Diplom
//
//  Created by M M on 7/25/23.
//

import UIKit

class HomeViewController: UIViewController {


    // MARK: - Values
    private let viewModel: HomeVMProtocol?

    // MARK: - View Elements
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "postCell")
        tableView.register(ContactsCell.self, forCellReuseIdentifier: "contactsCell")

        tableView.sectionFooterHeight = 0
        tableView.estimatedRowHeight = UITableView.automaticDimension
        //tableView.rowHeight = 414

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

            let subviews = [tableView]
            subviews.forEach({ view.addSubview($0) })

            tableView.snp.makeConstraints { make in
                make.top.bottom.leading.trailing.equalToSuperview()
            }
        }
}

extension HomeViewController: UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

extension HomeViewController: UITableViewDataSource {
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath) as? ContactsCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
                return cell
            }
            return cell
        }
    }

}

