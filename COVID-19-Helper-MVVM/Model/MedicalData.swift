//
//  MedicalData.swift
//  COVID-19-Helper-MVVM
//
//  Created by Sushree Swagatika on 09/05/20.
//  Copyright © 2020 Sushree Swagatika. All rights reserved.
//

import Foundation

struct MedicalData: Decodable {
    var data: MedicalColleges
}

struct MedicalColleges: Decodable {
    var medicalColleges: [CapacityData]
}

struct CapacityData: Decodable {
    var state: String
    var city: String
    var admissionCapacity: Int
    var hospitalBeds: Int
    var collegeName: String
    
    enum CodingKeys: String, CodingKey {
        case state, city, admissionCapacity, hospitalBeds, collegeName = "name"
    }
}
