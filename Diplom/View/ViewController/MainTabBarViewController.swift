//
//  MainTabBarViewController.swift
//  Diplom
//
//  Created by M M on 7/26/23.
//

import Foundation
import UIKit

final class MainTabBarViewController: UITabBarController {

    // MARK: - Values
    private let homeVC = NavFactory(navcon: UINavigationController(), tab: .home)
    private let profileVC = NavFactory(navcon: UINavigationController(), tab: .profile)
    private let savedVC = NavFactory(navcon: UINavigationController(), tab: .saved)

    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setControllers()
        setupView()
    }

    private func setupView() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = UIColor(named: "TextColor_Honey")
        tabBar.isTranslucent = false

        homeVC.navcon.tabBarItem.image = UIImage(named: "homepage")
        profileVC.navcon.tabBarItem.image = UIImage(named: "user")
        savedVC.navcon.tabBarItem.image = UIImage(named: "like")
    }

    private func setControllers() {
        viewControllers = [
            homeVC.navcon,
            profileVC.navcon,
            savedVC.navcon
        ]
    }
}
