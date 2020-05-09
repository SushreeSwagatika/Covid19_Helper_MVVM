//
//  APIHelper.swift
//  COVID-19-Helper-MVVM
//
//  Created by Sushree Swagatika on 09/05/20.
//  Copyright © 2020 Sushree Swagatika. All rights reserved.
//

import UIKit
import Alamofire

class APIHelper: NSObject {
    
    static let shared = APIHelper()
    
    func fetchStateData(completion: @escaping ([State?],Error?)->Void) {
        let request = AF.request(URLs.getStateData, method: .get)
        
        request.validate(contentType: ["application/json"]).responseDecodable(of: Report.self) { (response) in
            guard let report = response.value else { return }
            
            if let data = report.data.regional as? [State] {
                completion(data,nil)
            } else {
                print("Error")
            }
            
        }
    }
    
    func fetchCapacityListData(completion: @escaping ([CapacityData?],Error?)->Void) {
        let request = AF.request(URLs.getCollegesData, method: .get)
        
        request.validate(contentType: ["application/json"]).responseDecodable(of: MedicalData.self) {(response) in
            guard let report = response.value else { return }
            
            if let data = report.data.medicalColleges as? [CapacityData] {
                completion(data,nil)
            } else {
                print("Error")
            }
        }
    }
}
