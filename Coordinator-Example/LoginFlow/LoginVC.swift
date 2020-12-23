//
//  LoginVC.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan on 22.12.2020.
//

import UIKit

final class LoginVC: UIViewController {

    @IBOutlet private weak var startHomwFlow: UIButton!
    
    var viewModel: LoginVMProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func startHomeFlow(_ sender: Any) {
        viewModel.startHomeFlow()
    }
    
}
extension LoginVC: StoryboardInstantiate {
    static var storyboardType: StoryboardType { return .start }
}
