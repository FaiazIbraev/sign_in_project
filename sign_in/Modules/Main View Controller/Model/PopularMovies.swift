//
//  PopularMovies.swift
//  sign_in
//
//  Created by Faiaz Ibraev on 13/9/22.
//

import Foundation

struct PopularMovies: Codable{
    var results: [PopularMovie]?
}

struct PopularMovie: Codable{
    var id: Int?
    var original_title: String?
    var poster_path: String?
    var overview: String?
}
