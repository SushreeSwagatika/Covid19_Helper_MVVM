//
//  StateViewModel.swift
//  COVID-19-Helper-MVVM
//
//  Created by Sushree Swagatika on 08/05/20.
//  Copyright © 2020 Sushree Swagatika. All rights reserved.
//

import Foundation
import UIKit

struct StateViewModel {
    var name: String
    var detailText: String
    var accessoryType: UITableViewCell.AccessoryType
    
    init(_ state: State){
        self.name = state.name
        self.detailText = #"Active:\#(state.activeCases), Recovered:\#(state.recoveredCases), Deceased:\#(state.deathCases)"#
        if state.activeCases > 2000 {
            self.accessoryType = .detailDisclosureButton
        } else {
            self.accessoryType = .none
        }
    }
}
