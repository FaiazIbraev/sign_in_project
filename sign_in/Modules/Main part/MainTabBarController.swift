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
        setViewControllers([setupMainVC(), setupProfileVC()], animated: true)
    }
    
    private func setupMainVC() -> UIViewController{
        let vc = MainViewController()
        vc.tabBarItem.title = "Main"
       
        vc.tabBarItem.image = UIImage(named: "home")?.withTintColor(UIColor.white)
        vc.tabBarItem.selectedImage = UIImage(named: "home")?.withTintColor(UIColor.blue)
        
        return vc
    }
    
    private func setupProfileVC() -> UIViewController{
        let vc = ProfileViewController()
        vc.tabBarItem.title = "Profile"
      
        vc.tabBarItem.image = UIImage(named: "profile")?.withTintColor(UIColor.white)
        vc.tabBarItem.selectedImage = UIImage(named: "profile")?.withTintColor(UIColor.blue)
        
        return vc
    }
    
    func setupMainViewController(_ viewControllerType: ViewControllerType) -> UIViewController{
        let vc = viewControllerType.viewController
        vc.tabBarItem.title = viewControllerType.title
        vc.tabBarItem.image = viewControllerType.unselectedImage
        vc.tabBarItem.image = viewControllerType.selectedImage
        
        return vc
    }
    
}
