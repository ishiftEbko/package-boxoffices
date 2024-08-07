//
//  Movie.swift
//
//
//  Created by ISHIFT_EB on 8/6/24.
//

import Foundation

public struct Movie: Decodable {
    public let rank: String
    public let code: String
    public let name: String
    
    // 응답 받는 프로퍼티 변수명과 json에 정의된 key값이 다른 경우
    // CodingKey를 이용해서 서로 이어줘야 함
    private enum CodingKeys: String, CodingKey {
        case rank
        case code = "movieCd"
        case name = "movieNm"
    }
}
