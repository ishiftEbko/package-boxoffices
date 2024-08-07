//
//  URLRequest.swift
//  
//
//  Created by ISHIFT_EB on 8/6/24.
//

import Foundation

extension URLRequest {
    init(
        urlString: String,
        httpMethod: HTTPMethod,
        key: String,
        queryItems: [URLQueryItem]?
    ) throws {
        // url components
        guard var components = URLComponents(string: urlString) else {
            throw APIError.urlIsInvalid
        }
        
        // query items
        components.queryItems = [URLQueryItem(name: "key", value: key)]
        if let queryItems {
            components.queryItems?.append(contentsOf: queryItems)
        }
        
        // url request
        guard let url = components.url else {
            throw APIError.urlIsInvalid
        }
        self.init(url: url)
        
        // http method
        self.httpMethod = httpMethod.capitalizedValue
    }
}
