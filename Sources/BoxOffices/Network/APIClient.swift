//
//  APIClient.swift
//  
//
//  Created by ISHIFT_EB on 8/6/24.
//

import Foundation

class APIClient {
    let baseURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/"
    let key: String
    
    init(key: String) {
        self.key = key
    }
    
    /**
     요청을 보내고 응답을 가져올 함수
     어떤 응답인지 모르지만, 그 응답의 타입을 Decodable로 제네릭 타입으로 선언
     */
    func fetch<Response: Decodable>(
        path: String,
        httpMethod: HTTPMethod,
        queryItems: [URLQueryItem]? = nil
    ) async throws -> Response {
        // url request 생성
        let urlRequest = try URLRequest(
            urlString: "\(baseURL)\(path)",
            httpMethod: httpMethod,
            key: key,
            queryItems: queryItems
        )
        
        // url session data
        let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
        
        // http url response
        if let error = APIError(httpResponse: urlResponse as? HTTPURLResponse) {
            throw error
        }
        
        let output = try JSONDecoder().decode(Response.self, from: data)
        return output
    }
}
