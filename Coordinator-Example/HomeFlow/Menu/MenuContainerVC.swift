//
//  MenuContainerVC.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan on 23.12.2020.
//

import UIKit

class MenuContainerVC: UIViewController {
    
    let transition = SlideInTransition()
    
    var didDismissMenuWithMenuOption: ((MenuOptions?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuBarButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setupMenuBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "closeMenu"), style: .plain, target: self, action: #selector(toggleMenu))
    }
    
    @objc func toggleMenu() {
        let menuViewController = MenuViewController()
        menuViewController.delegate = self
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
        tabBarController?.tabBar.isHidden = true
    }
    
    func dismissMenu(withMenuOption menuOption: MenuOptions?) {
        dismiss(animated: true) {
            self.tabBarController?.tabBar.isHidden = false
            self.didDismissMenuWithMenuOption?(menuOption)
        }
    }
}

extension MenuContainerVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}

extension MenuContainerVC: MenuVCDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOptions?) {
        dismissMenu(withMenuOption: menuOption)
    }
}
