//
//  AppDelegate.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan on 22.11.2020.
//

import UIKit

protocol AppSetupProtocol: AnyObject {
    func setupCoordinator()
    func startWithDeeplink(_ deeplinkType: [AnyHashable : Any])
    func startWithDeeplink(_ deeplinkType: NSUserActivity)
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var mainCoordinator: MainCoordinator?
    
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupCoordinator()
        mainCoordinator?.start()
        return true
    }
    
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        startWithDeeplink(userInfo)
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        startWithDeeplink(userActivity)
        return true
    }
}


extension AppDelegate: AppSetupProtocol {

    internal func setupCoordinator() {
        window = UIWindow()
        let navigation = UINavigationController()
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        window!.rootViewController = navigation
        window!.makeKeyAndVisible()
        mainCoordinator = MainCoordinator(navigation, false)
        mainCoordinator?.window = window
    }
    
    internal func startWithDeeplink(_ deeplinkType: [AnyHashable : Any]) {
        let data = deeplinkType as? [String: AnyObject]
        let deepLink = DeepLinkOption.build(with: data)
        mainCoordinator?.start(with: deepLink)
    }
    
    internal func startWithDeeplink(_ deeplinkType: NSUserActivity) {
        let deepLink = DeepLinkOption.build(with: deeplinkType)
        mainCoordinator?.start(with: deepLink)
    }
    
}
