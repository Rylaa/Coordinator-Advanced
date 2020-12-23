//
//  LoginVM.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan on 22.12.2020.
//

import Foundation


protocol LoginVMProtocol: LoginVMCoordinatorProtocol {
    // TODO: asd
   
}

protocol LoginVMCoordinatorProtocol: AnyObject {
    var coordinator: Coordinator? { get set }
    func startHomeFlow()
}


final class LoginVM: LoginVMProtocol {
    
    weak var coordinator: Coordinator?
    
    init() {}
    
}

extension LoginVM {
    
    final func startHomeFlow() {
        coordinator?.finishFlow()
    }
    
    
    
}
