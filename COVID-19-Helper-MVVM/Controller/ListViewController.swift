//
//  ListViewController.swift
//  COVID-19-Helper-MVVM
//
//  Created by Sushree Swagatika on 09/05/20.
//  Copyright © 2020 Sushree Swagatika. All rights reserved.
//

import UIKit

typealias UITableViewMethods = UITableViewDataSource & UITableViewDelegate

class ListViewController: UIViewController {

    @IBOutlet var tblStateList: UITableView!
    @IBOutlet var slider: UISlider!
    @IBOutlet var lblCount: UILabel!
    
    var stateViewModels = [StateViewModel]()
    var finalData: [State?]!
    var sliderValue = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSlider()
        fetchData()
        
    }
    
    private func fetchData() {
        APIHelper.shared.fetchStateData { (data, error) in

            if let error = error {
                debugPrint("Failed to fetch state data :",error)
                return
            }
            self.finalData = data
            self.stateViewModels = data.map({return StateViewModel($0!)}) 
            self.reloadTable()
        }
    }
    
    private func reloadTable() {
        self.tblStateList.reloadData()
    }
    
    private func setupSlider() {
        DispatchQueue.main.async {
            self.slider.minimumValue = 1
            self.slider.maximumValue = 20000
            self.slider.value = 5000
            
            self.lblCount.text = #"\#(Int(self.slider.value)) active"#
        }
    }
    
    
    @IBAction func didChangeSliderValue(_ sender: UISlider) {
        sliderValue = Int(self.slider.value)
        lblCount.text = #"\#(sliderValue) active"#
        if sliderValue < 1 {
            self.slider.value = 1
            return
        } else if sliderValue > 20000 {
            self.slider.value = 20000
            return
        }
        let activeCovid19States = self.finalData.filter{$0!.activeCases >= self.sliderValue}
        self.stateViewModels = activeCovid19States.map({return StateViewModel($0!)})
        self.reloadTable()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SendDataSegue" {
            let indexPath = self.tblStateList!.indexPathForSelectedRow
            let currentStateData = stateViewModels[indexPath!.row]
            let state = currentStateData.name
            
            let vc = segue.destination as! DetailViewController
            vc.filterState = state
        }
    }

}

extension ListViewController: UITableViewMethods {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.stateCell) as! StateCell
        
        let currentStateData = stateViewModels[indexPath.row]
        cell.stateModel = currentStateData
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "SendDataSegue", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
