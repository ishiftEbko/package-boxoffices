//
//  APIClientTests.swift
//
//
//  Created by ISHIFT_EB on 8/6/24.
//

import XCTest
@testable import BoxOffices

final class APIClientTests: XCTestCase {
    func test_fetch() async throws {
        // http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=6be86e32039d27f8bbbd4c20d9b9e748&targetDt=20240713
        
        struct Response: Decodable {
            let boxOfficeResult: BoxOfficeResult
            
            struct BoxOfficeResult: Decodable {
                let dailyBoxOfficeList: [DailyBoxOfficeList]
                
                struct DailyBoxOfficeList: Decodable {
                    var movieCd: String
                    var movieNm: String
                }
            }
        }
        
        let apiClient = APIClient(key: "6be86e32039d27f8bbbd4c20d9b9e748")
        let response: Response = try await apiClient.fetch(
            path: "boxoffice/searchDailyBoxOfficeList.json",
            httpMethod: .get,
            queryItems: [URLQueryItem(name: "targetDt", value: "20240713")]
        )
        
        XCTAssertEqual(response.boxOfficeResult.dailyBoxOfficeList.count, 10)
    }
}
