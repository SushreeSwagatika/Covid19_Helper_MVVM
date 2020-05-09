//
//  DetailCapacityViewModel.swift
//  COVID-19-Helper-MVVM
//
//  Created by Sushree Swagatika on 09/05/20.
//  Copyright © 2020 Sushree Swagatika. All rights reserved.
//

import Foundation

struct DetailCapacityViewModel {
    var name: String
    var detail: String
    var groupName: String
    var state: String
    
    init(_ capacityData: CapacityData) {
        self.name = capacityData.collegeName
        self.detail = #"Hospital Beds = \#(capacityData.hospitalBeds), AdmissionCapacity = \#(capacityData.admissionCapacity)"#
        self.groupName = capacityData.city
        self.state = capacityData.state
    }
}
