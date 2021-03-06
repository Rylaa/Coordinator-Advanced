//
//  HomeFlowCoordinator.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan on 22.12.2020.
//

import UIKit

final class HomeFlowCoordinator: Coordinator {
    
    weak var finihFlowDelegate: CoordinatorDidFnish?
    var childrenCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private(set) var tabbarController: UITabBarController!
 
    
    var state: CoordinatorType { .tab }
        
 
    init(_ navigationController: UINavigationController, _ setHideNavBar: Bool) {
        self.navigationController = navigationController
        tabbarController = navigationController.topViewController as? UITabBarController
        
        let tab1Coordinator = Tab1Coordinator(Tab1VC.instantiate(), false)
        let tab2Coordinator = Tab2Coordinator(Tab2VC.instantiate(), false)
         
        tabbarController.viewControllers = [ tab1Coordinator.rootViewController,
                                             tab2Coordinator.rootViewController ]
        
        childrenCoordinators.append(tab1Coordinator)
        childrenCoordinators.append(tab2Coordinator)
    }
    
    func start() {
        tabbarController.selectedIndex = 0
        childrenCoordinators.forEach { (coordinator) in
            coordinator.finihFlowDelegate = self
            coordinator.start()
        }
    
    }
}


extension HomeFlowCoordinator: CoordinatorDidFnish {
    func didFinish(coordinator: Coordinator) {
        childrenCoordinators = childrenCoordinators
            .filter { $0 !== coordinator }
        
        checkCoordinatorType(with: coordinator.state)
    }
    
    func checkCoordinatorType(with coordinatorType: CoordinatorType) {
        navigationController.viewControllers.removeAll()
        
        switch coordinatorType {
        case .login:
            finihFlowDelegate?.didFinish(coordinator: self)
        case .tab:
        // açılacak case / sayfa
        print("todo")
        default:
            break
        }
        
    }
}
