//
//  BaseButtonType.swift
//  sign_in
//
//  Created by Student on 17/9/22.
//

import Foundation

enum BaseButtonType{
    case history
    case contacts
    case aboutUs
    case quitApp
}

extension BaseButtonType{
    var title: String{
        switch self {
        case .history:
            return "History"
        case .contacts:
            return "contacts"
        case .aboutUs:
            return "about Us"
        case .quitApp:
            return "Leave app"
        }
    }
    
}
