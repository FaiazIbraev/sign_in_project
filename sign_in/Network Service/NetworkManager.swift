//
//  NetworkManager.swift
//  sign_in
//
//  Created by Faiaz Ibraev on 13/9/22.
//

import Foundation

protocol NetworkManagerProtocol{
    func getPopularMovies(completion: ((PopularMovies)->Void)?)
    func getDetailedData(id: Int, completion: ((DetailedMovieModel)->Void)?)
    func getImage(endPath: String, completion: ((Data)->Void)?)
}

class NetworkManager: NetworkManagerProtocol{
    
    let urlSession = URLSession.shared
    
    func getPopularMovies(completion: ((PopularMovies)->Void)?){
        let url = URL(string: URLStrings.popularMovies.urlString)
        if let url = url {
            urlSession.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let movies = self.parseJSON(data: data){
                        completion!(movies)
                    }
                }
            }.resume()
        }
    }
    
    func getDetailedData(id: Int, completion: ((DetailedMovieModel)->Void)?){
        let url = URL(string: URLStrings.movieById(id: id).urlString)
        
        if let url = url {
            urlSession.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let movieData = self.parseDetailedMovieJSON(data: data){
                        completion!(movieData)
                    }
                }
            }.resume()
        }
    }

}

extension NetworkManager{
    private func parseJSON(data: Data) -> PopularMovies?{
         let decoder = JSONDecoder()
         
         do{
             let decodedData = try
             decoder.decode(PopularMovies.self, from: data)
             return decodedData
         }catch{
             print(error)
             return nil
     }
 }
    
    private func parseDetailedMovieJSON(data: Data) -> DetailedMovieModel?{
         let decoder = JSONDecoder()
         
         do{
             let decodedData = try
             decoder.decode(DetailedMovieModel.self, from: data)
             return decodedData
         }catch{
             print(error)
             return nil
     }
 }
    
}

extension NetworkManager{
    func getImage(endPath: String, completion: ((Data)->Void)?){
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(endPath)")
        if let url = url {
            urlSession.dataTask(with: url) { data, response, error in
                if let data = data {
                        completion!(data)
                }
            }.resume()
        }
    }
}
