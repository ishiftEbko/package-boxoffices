//
//  Response.swift
//
//
//  Created by ISHIFT_EB on 8/6/24.
//

import Foundation

struct boxOfficeResponse: Decodable {
    let boxOfficeResult: BoxOfficeResult
    
    struct BoxOfficeResult: Decodable {
        let dailyBoxOfficeList: [Movie]
    }
}
