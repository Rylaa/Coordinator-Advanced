//
//  Router.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan on 22.11.2020.
//

import Foundation
import UIKit

protocol Router {
    func present(_ module: UIViewController, animated: Bool)
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    func push(_ module: UIViewController, animated: Bool, completion: (() -> Void)?)
    func popModule(animated: Bool)
    func setAsRoot(_ module: UIViewController)
    func popToRootModule(animated: Bool)
}

extension Router {
    func present(_ module: UIViewController, animated: Bool) { }
    func dismissModule(animated: Bool, completion: (() -> Void)?) { }
    func push(_ module: UIViewController, animated: Bool, completion: (() -> Void)?) { }
    func popModule(animated: Bool) { }
    func setAsRoot(_ module: UIViewController) { }
    func popToRootModule(animated: Bool) { }
}
