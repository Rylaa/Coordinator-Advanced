//
//  PresentVC.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan on 23.12.2020.
//

import UIKit

final class PresentVC: UIViewController {
    
    var didFinish: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI() 
    }
    
    func setupUI() {
        navigationItem.title = "Present"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "closeMenu"), style: .plain, target: self, action: #selector(dismissView))
        view.backgroundColor = UIColor.red
        
       
    }
    
    @objc func dismissView() {
        didFinish?()
    }
}
