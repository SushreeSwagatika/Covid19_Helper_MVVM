//
//  Utility.swift
//  COVID-19-Helper-MVVM
//
//  Created by Sushree Swagatika on 08/05/20.
//  Copyright © 2020 Sushree Swagatika. All rights reserved.
//

import Foundation

enum CellIdentifier {
    static var stateCell = "stateCell"
    static var detailCell = "detailCell"
}

enum URLs {
    static var getStateData = "https://api.rootnet.in/covid19-in/stats/latest"
    static var getCollegesData = "https://api.rootnet.in/covid19-in/hospitals/medical-colleges"
}
