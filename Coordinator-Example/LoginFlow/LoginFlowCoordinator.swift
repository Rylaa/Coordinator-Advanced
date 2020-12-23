//
//  LoginFlow.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan on 22.12.2020.
//

import UIKit

protocol LoginFlowCoordinatorProtocol: AnyObject {
    func presentLoginVC()
    func fnishLoginFlow()
}

final class LoginFlowCoordinator: Coordinator, LoginFlowCoordinatorProtocol {
  
    weak var finihFlowDelegate: CoordinatorDidFnish?
    var childrenCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    var state: CoordinatorType { .login }
    
    init(_ navigationController: UINavigationController, _ setHideNavBar: Bool) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(setHideNavBar, animated: false)
    }
    
    func start() {
        presentLoginVC()
    }
   
}

extension LoginFlowCoordinator {
    internal func presentLoginVC() {
        let viewController = LoginVC.instantiate()
        let viewModel = LoginVM()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func fnishLoginFlow() {
        finihFlowDelegate?.didFinish(coordinator: self)
    }
    
}
