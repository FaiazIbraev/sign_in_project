//
//  URLStrings.swift
//  sign_in
//
//  Created by Faiaz Ibraev on 13/9/22.
//

import Foundation

enum URLStrings{
    case popularMovies
    case movieById(id: Int)
    
    var urlString: String{
        switch self {
        case .popularMovies:
            return "\(mainPath)popular?\(apiKey)&page=1"
        case let .movieById(id):
            return "\(mainPath)\(id)?\(apiKey)"
        }
    }
    
    private var mainPath: String{
        return "https://api.themoviedb.org/3/movie/"
    }
    
    private var apiKey: String{
        return "api_key=57dcc9c9f2c583d276abd7d577fc1d9f"
    }
    
}

