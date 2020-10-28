//
//  Data.swift
//  CurrencyApp
//
//  Created by betul on 27.10.2020.
//  Copyright © 2020 betul. All rights reserved.
//

import UIKit

struct Data: Codable {
    let code: String
    let name: String
    let rate: Double
    let calculatedstr: String
    let calculated: Double
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case name = "name"
        case rate = "rate"
        case calculatedstr = "calculatedstr"
        case calculated = "calculated"
    }
}
