//
//  MovieDBHelper.swift
//  FamilyMovies
//
//  Created by Donny Wals on 01/07/2017.
//  Copyright © 2017 DonnyWals. All rights reserved.
//

import Foundation

struct MovieDBHelper {
    typealias IdAndRating = (id: Int?, rating: Double?)
    typealias DataExtractionCallback = (Data) -> IdAndRating
    typealias MovieDBCallback = (Int?, Double?) -> Void
    
    static let apiKey = "YOUR_API_KEY_HERE"
    
    enum Endpoint {
        case search
        case movieById(Int64)
        
        var urlString: String {
            let baseUrl = "https://api.themoviedb.org/3/"
            
            switch self {
            case .search:
                var urlString = "\(baseUrl)search/movie/"
                urlString = urlString.appending("?api_key=\(MovieDBHelper.apiKey)")
                return urlString
            case let .movieById(movieId):
                var urlString = "\(baseUrl)movie/\(movieId)"
                urlString = urlString.appending("?api_key=\(MovieDBHelper.apiKey)")
                return urlString
            }
        }
    }
    
    func fetchRating(forMovie movie: String, callback: @escaping MovieDBCallback) {
        let searchUrl = url(forMovie: movie)
        let extractData: DataExtractionCallback = { data in
            let decoder = JSONDecoder()
            
            guard let response = try? decoder.decode(MovieDBLookupResponse.self, from: data),
                let movie = response.results.first
                else { return (nil, nil) }
            
            return (movie.id, movie.popularity)
        }
        
        fetchRating(fromUrl: searchUrl, extractData: extractData, callback: callback)
    }
    
    func fetchRating(forMovieId id: Int64, callback: @escaping MovieDBCallback) {
        let movieUrl = url(forMovieId: id)
        
        let extractData: DataExtractionCallback = { data in
            let decoder = JSONDecoder()
            
            guard let movie = try? decoder.decode(MovieDBLookupResponse.MovieDBMovie.self, from: data)
                else { return (nil, nil) }
            
            return (movie.id, movie.popularity)
        }
        
        fetchRating(fromUrl: movieUrl, extractData: extractData, callback: callback)
    }
    
    private func fetchRating(fromUrl url: URL?, extractData: @escaping DataExtractionCallback, callback: @escaping MovieDBCallback) {
        guard let url = url else {
            callback(nil, nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            var rating: Double? = nil
            var remoteId: Int? = nil
            
            defer {
                callback(remoteId, rating)
            }
            
            guard error == nil
                else { return }
            
            guard let data = data
                else { return }
            
            let resultingData = extractData(data)
            rating = resultingData.rating
            remoteId = resultingData.id
        }
        
        task.resume()
    }
    
    private func url(forMovie movie: String) -> URL? {
        guard let escapedMovie = movie.addingPercentEncoding(withAllowedCharacters:
            .urlHostAllowed)
            else { return nil }
        
        var urlString = Endpoint.search.urlString
        urlString = urlString.appending("&query=\(escapedMovie)")
        
        return URL(string: urlString)
    }
    
    private func url(forMovieId id: Int64) -> URL? {
        let urlString = Endpoint.movieById(id).urlString
        return URL(string: urlString)
    }
}
