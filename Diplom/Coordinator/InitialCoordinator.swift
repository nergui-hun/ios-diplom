//
//  ProfileCoordinator.swift
//  Diplom
//
//  Created by M M on 7/26/23.
//

import Foundation
import UIKit

protocol InitialCoordinatorProtocol {
    //func openInitialVC()
    func openRegisterVC(navcon: UINavigationController)
    func openLoginVC(navcon: UINavigationController)
    func openProfileVC()
}

final class InitialCoordinator: InitialCoordinatorProtocol {

    // MARK: - Values

    private let parentCoordinator: AppCoordinatorProtocol
    //private let profileVM = ProfileVM()
    private let navcon: UINavigationController
    private let window: UIWindow?

    // MARK: - init()
    init(parentCoordinator: AppCoordinatorProtocol, window: UIWindow?) {
        self.navcon = .init()
        self.parentCoordinator = parentCoordinator
        self.window = window
    }

    /*func openInitialVC() {
        let initialVC = InitialViewController(coder: self)
        self.navcon.pushViewController(initialVC, animated: true)

    }*/

    func openRegisterVC(navcon: UINavigationController) {
        let registerVC = RegisterViewController()
        navcon.pushViewController(registerVC, animated: true)
        //print("test")
    }

    func openLoginVC(navcon: UINavigationController) {
        let loginVC = LoginViewController()
        navcon.pushViewController(loginVC, animated: true)
        //print("test")
    }

    func openProfileVC() {
        
    }
}
