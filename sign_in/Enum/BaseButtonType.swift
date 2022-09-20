//
//  BaseButtonType.swift
//  sign_in
//
//  Created by Student on 17/9/22.
//

import Foundation

enum BaseButtonType{
    case email
    case password
    case confirmPass
}

extension BaseButtonType{
    var title: String{
        switch self {
        case .email:
            return "Почта"
        case .password:
            return "Пароль"
        case .confirmPass:
            return "Подтвердите пароль"
        }
    }
    
    var incorrectPass: String{
        switch self {
        case .email:
            return ""
        case .password:
            return ""
        case .confirmPass:
            return "Пароли не совпадают"
        }
    }
    
}
