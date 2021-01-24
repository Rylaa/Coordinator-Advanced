//
//  Tab2Coordinator.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan on 23.12.2020.
//

import UIKit


final class Tab1Coordinator: Coordinator, MenuOptionPresenter {
    
    var childrenCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var finihFlowDelegate: CoordinatorDidFnish?
    var state: CoordinatorType { .tab }
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    

    
    init(_ viewController: UIViewController, _ setHideNavBar: Bool) {
        viewController.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(named: "closeMenu"), selectedImage: nil)
        navigationController = UINavigationController(rootViewController: viewController)
     // todo
    }
    
    func start() {
        let viewController = navigationController.topViewController as! Tab1VC
        viewController.didDismissMenuWithMenuOption = checkMenuTrigger
    }
    
    private func checkMenuTrigger(trigger: MenuOptions?) {
        self.handleMenuOption(trigger)
    }
    
}
