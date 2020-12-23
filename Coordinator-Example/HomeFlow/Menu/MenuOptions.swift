//
//  MenuOption.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan on 23.12.2020.
//

import UIKit

enum MenuOptions: Int {
    
    case profile
    case legal
    case rate
    case settings
    
    var description: String {
        switch self {
        case .profile: return "Profile"
        case .legal: return "Legal"
        case .rate: return "Rate Us"
        case .settings: return "Settings"
        }
    }
    
    var image: String {
        switch self {
        case .profile: return "ic_user"
        case .legal: return "ic_legal"
        case .rate: return "ic_star"
        case .settings: return "ic_settings"
        }
    }
}

protocol MenuOptionPresenter {
    func handleMenuOption(_ menuOption: MenuOptions?)
}

extension MenuOptionPresenter where Self: Coordinator {
    func handleMenuOption(_ menuOption: MenuOptions?) {
        guard let menuOption = menuOption else { return }
        switch menuOption {
        case .settings:
            presentSettings()
        default:
            break
        }
    }
    
    func presentSettings() {
        let vc = PresentVC()
        vc.didFinish = { [weak self] in
            self?.navigationController.dismiss(animated: true, completion: nil)
        }
        navigationController.present(UINavigationController(rootViewController: vc), animated: true)
    }
}
