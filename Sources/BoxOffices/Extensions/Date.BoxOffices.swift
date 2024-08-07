//
//  Date.BoxOffices.swift
//
//
//  Created by ISHIFT_EB on 8/6/24.
//

import Foundation

extension Date {
    var yesterday: Date? {
        Calendar.current.date(byAdding: .day, value: -1, to: self)
    }
}
