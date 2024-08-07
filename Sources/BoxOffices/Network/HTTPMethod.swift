//
//  HTTPMethod.swift
//  
//
//  Created by ISHIFT_EB on 8/6/24.
//

import Foundation

enum HTTPMethod: String {
    case get //, post, delete, put
    
    var capitalizedValue: String {
        self.rawValue.capitalized
    }
}
