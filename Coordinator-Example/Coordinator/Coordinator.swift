//
//  Coordinator.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan on 22.11.2020.
//

import Foundation
import UIKit


protocol Coordinator: Router, AnyObject {
    var childrenCoordinators: [Coordinator] { get set}
    var navigationController: UINavigationController { get set }
    var finihFlowDelegate: CoordinatorDidFnish? { get set }
    var state: CoordinatorType { get }
   
    
    init(_ navigationController: UINavigationController, _ setHideNavBar: Bool)
    init(_ viewController: UIViewController, _ setHideNavBar: Bool)
    init(_ tabbarController: UITabBarController, _ setHideNavBar: Bool)
    
    func start()
    func start(with option: DeepLinkOption?)
    func finishFlow()
    
}

protocol CoordinatorDidFnish: AnyObject {
    func didFinish(coordinator: Coordinator)
}

enum CoordinatorType {
    case app, login, tab, menu
}


extension Coordinator {
    func start(with option: DeepLinkOption?) {
        start(with: option)
    }
    
    func finishFlow() {
        self.childrenCoordinators.removeAll()
        finihFlowDelegate?.didFinish(coordinator: self)
    }
    
    init(_ viewController: UIViewController, _ setHideNavBar: Bool) {
        self.init(viewController, setHideNavBar)
    }
    
    init(_ navigationController: UINavigationController, _ setHideNavBar: Bool) {
        self.init(navigationController, setHideNavBar)
    }
    
    init(_ tabbarController: UITabBarController, _ setHideNavBar: Bool) {
        self.init(tabbarController, setHideNavBar)
    }
    
}







//
//
//
//final class TabbarCoordinator: Coordinator {
//    /// Properties
//    var childrenCoordinators: [Coordinator]
//    var navigationController: UINavigationController
//    var parentCoordinator: Coordinator?
//    let tabBarViewController = TabbarViewController()
//    let network: NetworkManager
//
//    /// Init
//    init(network: NetworkManager, navigationController: UINavigationController) {
//        self.navigationController = UINavigationController()
//        self.network = network
//        childrenCoordinators = []
//
//    }
//
//    func start() {
//        let homeNavController = UINavigationController()
//        let homeCoordinator = HomeCoordinator(network: network, navigationController: homeNavController)
//        homeCoordinator.parentCoordinator = self
//        childrenCoordinators.append(homeCoordinator)
//        homeCoordinator.start()
//
//        let testNavController = UINavigationController()
//        let testCoordinator = TestCoordinator(network: network, navigationController: testNavController)
//        testCoordinator.parentCoordinator = self
//        childrenCoordinators.append(testCoordinator)
//        testCoordinator.start()
//
//        let notifyNavController = UINavigationController()
//        let notificationCoordinator = NotificationCoordinator(navigationController: notifyNavController)
//        notificationCoordinator.parentCoordinator = self
//        childrenCoordinators.append(notificationCoordinator)
//        notificationCoordinator.start()
//
//        let profileNavController = UINavigationController()
//        let profileCoordinator = ProfileCoordinator(navigationController: profileNavController)
//        profileCoordinator.parentCoordinator = self
//        childrenCoordinators.append(profileCoordinator)
//        profileCoordinator.start()
//
//        tabBarViewController.viewControllers = [homeNavController, testNavController, notifyNavController, profileNavController]
//        app.window?.rootViewController = tabBarViewController
//
//    }
//}
