//
//  MainTabBarController.swift
//  sign_in
//
//  Created by Student on 3/9/22.
//

import UIKit

class MainTabBarController: UITabBarController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarAppereance()
        setupViewControllers()
    }
    
    func setupTabBarAppereance(){
        self.tabBar.isTranslucent = true
        self.tabBar.backgroundColor = .lightGray
        
    }
    
    func setupViewControllers(){
        setViewControllers([setupCurrentViewController(.main), setupCurrentViewController(.profile), setupCurrentViewController(.settings), setupCurrentViewController(.more)], animated: true)
    }

    
    func setupCurrentViewController(_ viewControllerType: ViewControllerType) -> UIViewController{
        let vc = viewControllerType.viewController
        vc.tabBarItem.title = viewControllerType.title
        vc.tabBarItem.image = viewControllerType.unselectedImage
        vc.tabBarItem.selectedImage = viewControllerType.selectedImage
        
        return vc
    }
    
}
