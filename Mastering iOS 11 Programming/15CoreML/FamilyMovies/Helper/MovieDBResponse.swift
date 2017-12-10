//
//  MovieDBLookupResponse.swift
//  FamilyMovies
//
//  Created by Donny Wals on 01/07/2017.
//  Copyright © 2017 DonnyWals. All rights reserved.
//

import Foundation

struct MovieDBLookupResponse: Codable {
    struct MovieDBMovie: Codable {
        let popularity: Double?
        let id: Int?
    }
    
    let results: [MovieDBMovie]
}
