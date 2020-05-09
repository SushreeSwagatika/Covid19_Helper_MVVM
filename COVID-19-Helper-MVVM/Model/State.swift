//
//  State.swift
//  COVID-19-Helper-MVVM
//
//  Created by Sushree Swagatika on 08/05/20.
//  Copyright © 2020 Sushree Swagatika. All rights reserved.
//

import Foundation


struct State: Decodable {
    var name: String
    var activeCases: Int
    var deathCases: Int
    var recoveredCases: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "loc"
        case activeCases = "totalConfirmed"
        case deathCases = "deaths"
        case recoveredCases = "discharged"
    }
}
