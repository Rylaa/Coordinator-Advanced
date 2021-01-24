//
//  MainCoordinator.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan on 22.11.2020.
//

import UIKit

protocol MainCoordinatorRoute: AnyObject {
    func showLoginFlow()
    func showDeeplink()
    func showHomeFlow()
}

final class MainCoordinator: Coordinator, MainCoordinatorRoute {
    
    weak var finihFlowDelegate: CoordinatorDidFnish?
    var didFnish: CoordinatorDidFnish?
    var childrenCoordinators = [Coordinator]()
    var navigationController: UINavigationController
   
    var window: UIWindow?
    var state: CoordinatorType { .app }
    
    init(_ navigationController: UINavigationController, _ setHideNavBar: Bool) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(setHideNavBar, animated: true)
    }
    
}

extension MainCoordinator {
    func start() {
        showLoginFlow()
    }
    
    func start(with option: DeepLinkOption?) {
        
    }
}

// Child Coordinator
extension MainCoordinator {
    func showHomeFlow() {
        navigationController.setViewControllers([UITabBarController()], animated: false)
        let sideMenuCoordinator = HomeFlowCoordinator(navigationController, false)
        sideMenuCoordinator.finihFlowDelegate = self
        sideMenuCoordinator.start()
        childrenCoordinators.append(sideMenuCoordinator)
        
    }
    
    func showLoginFlow() {
        let loginCoordinator = LoginFlowCoordinator(navigationController, true)
        loginCoordinator.finihFlowDelegate = self
        loginCoordinator.start()
        childrenCoordinators.append(loginCoordinator)
    }
    
    func showDeeplink() {
        
    }
    
}

extension MainCoordinator: CoordinatorDidFnish {
    func didFinish(coordinator: Coordinator) {
        childrenCoordinators = childrenCoordinators
            .filter { $0 !== coordinator }
        
        checkCoordinatorType(with: coordinator.state)
    }
    
    func checkCoordinatorType(with coordinatorType: CoordinatorType) {
        navigationController.viewControllers.removeAll()
        
        switch coordinatorType {
        case .login:
            showHomeFlow()
        case .tab:
        // todo
        print("todo")
        default:
            break
        }
        
    }
}

