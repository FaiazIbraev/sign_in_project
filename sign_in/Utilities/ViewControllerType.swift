//
//  ViewControllerType.swift
//  sign_in
//
//  Created by Student on 3/9/22.
//

import UIKit

enum ViewControllerType{
    case main
    case profile
    case settings
    case more
    
    var viewController: UIViewController{
        switch self {
        case .main:
            return MainViewController()
        case .profile:
            return MainViewController()
        case .settings:
            return MainViewController()
        case .more:
            return MainViewController()
        }
    }
    
    var title: String{
        switch self {
        case .main:
            return "Main"
        case .profile:
            return "Profile"
        case .settings:
            return "Setting"
        case .more:
            return "More"
        }
    }
    
    var selectedImage: UIImage{
        switch self {
        case .main:
            return UIImage(named: "home")!
        case .profile:
            return UIImage(named: "profile")!
        case .settings:
            return UIImage(named: "home")!
        case .more:
            return UIImage(named: "home")!
        }
    }
    
    var unselectedImage: UIImage{
        switch self {
        case .main:
            return UIImage(named: "home")!
        case .profile:
            return UIImage(named: "profile")!
        case .settings:
            return UIImage(named: "home")!
        case .more:
            return UIImage(named: "home")!
        }
    }
    
}
