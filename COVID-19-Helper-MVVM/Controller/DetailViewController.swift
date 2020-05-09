//
//  DetailViewController.swift
//  COVID-19-Helper-MVVM
//
//  Created by Sushree Swagatika on 09/05/20.
//  Copyright © 2020 Sushree Swagatika. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var tbldetailView: UITableView!
    
    @IBOutlet var lblNoData: UILabel!
    
    var fullCapacityList = [CapacityData?]()
    var capacityViewModels = [DetailCapacityViewModel]()
    
    var filterState = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        self.title = filterState
    }
    
    private func fetchData() {
        APIHelper.shared.fetchCapacityListData { (data, error) in

            if let error = error {
                debugPrint("Failed to fetch capacity data :",error)
                return
            }
            self.fullCapacityList = data
            self.capacityViewModels = data.map({return DetailCapacityViewModel($0!)})
            self.capacityViewModels = self.capacityViewModels.filter{return $0.state == self.filterState}
            
            self.reloadTable()
        }
    }
    
    private func reloadTable() {
        if self.capacityViewModels.count == 0 {
            self.lblNoData.isHidden = false
            self.tbldetailView.isHidden = true
            return
        }
        self.lblNoData.isHidden = true
        self.tbldetailView.isHidden = false
        self.tbldetailView.reloadData()
    }
}

extension DetailViewController: UITableViewMethods {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.capacityViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.detailCell) as! DetailCell

        let currentCapacityData = self.capacityViewModels[indexPath.row]
        cell.capacityViewModel = currentCapacityData

        return cell
    }
    
    
}
