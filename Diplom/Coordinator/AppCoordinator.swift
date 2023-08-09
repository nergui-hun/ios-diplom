//
//  AppCoordinator.swift
//  Diplom
//
//  Created by M M on 7/25/23.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
    func startApp()
    func openProfile()
    func openLoginVC()
}

final class AppCoordinator: AppCoordinatorProtocol {

    // MARK: - View Elements
    let window: UIWindow?
    private var isLoggedIn = UserDefaults.standard.bool(forKey: "loggedIn")
    private let tabbar = MainTabBarViewController()

    // MARK: - init()
    init(window: UIWindow?) {
        self.window = window
        window?.makeKeyAndVisible()
    }

    func startApp() {

        //if isLoggedIn == true {
            openProfile()
        /*} else {
            openLoginVC()
        }*/
    }

    func openProfile() {
        self.window?.rootViewController = tabbar
    }

    func openLoginVC() {
            let initialCoordinator = InitialCoordinator(parentCoordinator: self, window: window)
            let initialVC = InitialViewController(parentCoordinator: initialCoordinator)
            self.window?.rootViewController = UINavigationController(rootViewController: initialVC)
    }
}
