//
//  RecipeAPIError.swift
//  Recipe_App
//
//  Created by jade  on 4/7/25.
//

import Foundation

enum RecipeAPIError: Error{
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unkownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidData: return "Invalid data"
        case .jsonParsingFailure: return "Failed to parse Data"
        case let .requestFailed(description): return "Request failed: \(description)"
        case let .invalidStatusCode(statusCode): return "Invalid Status code: \(statusCode)"
        case let .unkownError(error): return "An unknown Error occured \(error)"
        }
    }
}
