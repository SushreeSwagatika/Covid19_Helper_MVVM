//
//  Report.swift
//  COVID-19-Helper-MVVM
//
//  Created by Sushree Swagatika on 09/05/20.
//  Copyright © 2020 Sushree Swagatika. All rights reserved.
//

import Foundation

struct Report: Decodable {
    var data: Regional
}

struct Regional: Decodable {
    var regional: [State]
}
