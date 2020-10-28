//
//  Result.swift
//  CurrencyApp
//
//  Created by betul on 27.10.2020.
//  Copyright © 2020 betul. All rights reserved.
//

import UIKit

// MARK: - Result
struct Result: Codable {
    let base: String
    let lastupdate: String
    let data: [Data]

    enum CodingKeys: String, CodingKey {
        case base = "base"
        case lastupdate = "lastupdate"
        case data = "data"
    }
}
