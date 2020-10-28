//
//  Currency.swift
//  CurrencyApp
//
//  Created by betul on 27.10.2020.
//  Copyright © 2020 betul. All rights reserved.
//

import UIKit

class Currency: NSObject {
    
    // MARK: - Properties
       
    var code: String = ""
    var name: String = ""
    var rate: Double = 0.0
    var calculatedstr: String = ""
    var calculated: Double = 0.0
       
    // MARK: - Initialization
    
    init?( code:String, name:String, rate:Double, calculatedstr:String, calculated:Double) {
        // Initialize stored properties.
        self.code = code
        self.name = name
        self.rate = rate
        self.calculatedstr = calculatedstr
        self.calculated = calculated
        
    }

}
