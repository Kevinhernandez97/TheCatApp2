//
//  ApiError.swift
//  TheCatApp2
//
//  Created by Kevin Hernandez on 22/06/23.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case badURL
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String {
        switch self {
            case .badURL, .parsing, .unknown:
                return "Sorry, something went wrong."
            case .url(let error):
                return error?.localizedDescription ?? "Something went wrong."
        }
    }
    
    var description: String {
        switch self {
            case .badURL:
                return "Invalid URL"
            case .url(let error):
                return error?.localizedDescription ?? "url session error"
            case .parsing(let error):
                return "parsing error \(error?.localizedDescription ?? "")"
            case .unknown:
                return "Unknown error"
        }
    }
}
