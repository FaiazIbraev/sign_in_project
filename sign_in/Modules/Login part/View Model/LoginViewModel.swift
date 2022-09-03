//
//  LoginViewModel.swift
//  sign_in
//
//  Created by Student on 1/9/22.
//

import Foundation

class LoginViewModel{
    private let userName: String = "User"
    private let password: String = "user"
    
    var isUserAuthorized: ((Bool) -> Void)?
    
    func authorizeUser(login: String, password: String){
        if login.lowercased() == userName.lowercased() && password == self.password{
            UserDefaults.standard.set("\(login.lowercased())", forKey: "login")
            isUserAuthorized!(true)
        } else{
            isUserAuthorized!(false)
        }
    }
    
}
