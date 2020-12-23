//
//  StoryBoardInstainte.swift
//  Coordinator-Example
//
//  Created by Yusuf Demirkoparan on 22.11.2020.
//

import UIKit

enum StoryboardType: String {

    case start = "Main"
 
}

protocol StoryboardInstantiate {
    static var storyboardType: StoryboardType { get }
    static var storyboardIdentifier: String? { get }
    static var bundle: Bundle? { get }
}

extension StoryboardInstantiate {
    static var storyboardIdentifier: String? { return String(describing: self) }
    static var bundle: Bundle? { return nil }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardType.rawValue, bundle: bundle)
        if let strongIdentifier = storyboardIdentifier {
            return (storyboard.instantiateViewController(withIdentifier: strongIdentifier) as? Self)!
        }
        return (storyboard.instantiateInitialViewController() as? Self)!
    }
}
