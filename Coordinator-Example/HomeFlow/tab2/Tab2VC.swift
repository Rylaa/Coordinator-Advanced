//
//  Test1VC.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan on 14.12.2020.
//

import UIKit


final class Tab2VC: MenuContainerVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
}

extension Tab2VC: StoryboardInstantiate {
    static var storyboardType: StoryboardType { return .start }
}
