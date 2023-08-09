//
//  NavFactory.swift
//  Diplom
//
//  Created by M M on 7/26/23.
//

import Foundation
import UIKit

final class NavFactory {

    // MARK: - Values
    enum Tab {
        case home
        case profile
        case saved
    }

    let navcon: UINavigationController
    let tab: Tab
    
    // MARK: - init
    init(navcon: UINavigationController, tab: Tab) {
        self.navcon = navcon
        self.tab = tab
        startModule()
    }

    // MARK: - Methods
    func startModule() {
        let vc: UIViewController
        let homeVM = HomeVM()

        switch tab {
        case .home:
            vc = HomeViewController(viewModel: homeVM)
            vc.tabBarItem.title = "Главная"
        case .profile:
            vc = ProfileViewController(viewModel: homeVM)
            vc.tabBarItem.title = "Профиль"
        case .saved:
            vc = SavedViewController()
            vc.tabBarItem.title = "Избранное"
        }
        navcon.setViewControllers([vc], animated: true)
    }
}
