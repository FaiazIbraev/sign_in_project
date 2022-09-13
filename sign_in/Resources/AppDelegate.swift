//
//  AppDelegate.swift
//  sign_in
//
//  Created by Student on 30/8/22.
//

import UIKit
import SnapKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


var window: UIWindow?
    
    var navController: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        if let user = UserDefaults.standard.string(forKey: "login"){
            if user.isEmpty{
                loginApp()
            } else {
                mainApp()
            }
        } else {
            loginApp()
        }
        

        window.makeKeyAndVisible()
        
        return true
    }
    
    func loginApp(){
        self.window?.rootViewController = navController(vc: LoginViewController())
    }
    
    func mainApp(){
        self.window?.rootViewController = navController(vc: MainTabBarController())
    }
    
    func navController(vc:UIViewController) -> UINavigationController{
        navController = UINavigationController(rootViewController: vc)
        navController?.navigationBar.isHidden = true
        
        return navController ?? UINavigationController()
    }

}

