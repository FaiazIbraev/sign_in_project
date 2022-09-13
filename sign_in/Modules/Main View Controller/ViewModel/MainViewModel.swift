//
//  MainViewModel.swift
//  sign_in
//
//  Created by Faiaz Ibraev on 13/9/22.
//

import Foundation

protocol MainViewModelProtocol{
    func getPopularMovies(completion: ((PopularMovies)-> Void)?)
}

class MainViewModel: MainViewModelProtocol{
    var networkManager: NetworkManagerProtocol
    init(networkManager: NetworkManagerProtocol = NetworkManager()){
        self.networkManager = networkManager
    }
    
    func getPopularMovies(completion: ((PopularMovies)-> Void)?){
        networkManager.getPopularMovies { (movies) in
            completion!(movies)
        }
    }
}
