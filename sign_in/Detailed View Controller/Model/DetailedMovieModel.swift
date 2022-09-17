//
//  DetailedMovieModel.swift
//  sign_in
//
//  Created by Student on 17/9/22.
//

import Foundation
struct DetailedMovieModel: Codable{
    var original_title: String?
    var overview: String?
    var genres: [Genre]?
    var original_language: String?
    var homepage: String?
    var runtime: Int?
}

struct Genre: Codable{
    var name: String?
}
