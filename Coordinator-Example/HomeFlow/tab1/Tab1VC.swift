//
//  ViewController.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan on 22.11.2020.
//

import UIKit

class Tab1VC: MenuContainerVC {

    
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        self.tabBarController?.navigationController?.setNavigationBarHidden(false, animated: true)
        view.backgroundColor = .blue
        navigationItem.title = "XXX"
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(10)) {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
           //
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(15)) {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            //self.tabBarController?.navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }


}


extension Tab1VC: StoryboardInstantiate {
    static var storyboardType: StoryboardType { return .start }
}
