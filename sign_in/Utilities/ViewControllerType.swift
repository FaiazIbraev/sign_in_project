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
            return ProfileViewController()
        case .settings:
            return SettingsVC()
        case .more:
            return MoreVC()
        }
    }
    
    var title: String{
        switch self {
        case .main:
            return "Main"
        case .profile:
            return "Profile"
        case .settings:
            return "Settings"
        case .more:
            return "More"
        }
    }
    
    var selectedImage: UIImage{
        switch self {
        case .main:
            return UIImage(named: "home")!.withTintColor(.blue)
        case .profile:
            return UIImage(named: "profile")!.withTintColor(.blue)
        case .settings:
            return UIImage(named: "settings")!.withTintColor(.blue)
        case .more:
            return UIImage(named: "more")!.withTintColor(.blue)
        }
    }
    
    var unselectedImage: UIImage{
        switch self {
        case .main:
            return UIImage(named: "home")!.withTintColor(.white)
        case .profile:
            return UIImage(named: "profile")!.withTintColor(.white)
        case .settings:
            return UIImage(named: "settings")!.withTintColor(.white)
        case .more:
            return UIImage(named: "more")!.withTintColor(.white)
        }
    }
    
}
