//
//  StateCell.swift
//  COVID-19-Helper-MVVM
//
//  Created by Sushree Swagatika on 08/05/20.
//  Copyright © 2020 Sushree Swagatika. All rights reserved.
//

import UIKit

class StateCell: UITableViewCell {
    
    var stateModel: StateViewModel! {
        didSet {
            textLabel?.text = stateModel.name
            detailTextLabel?.text = stateModel.detailText
            accessoryType = stateModel.accessoryType
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel?.numberOfLines = 1
        textLabel?.textColor = UIColor.black
        detailTextLabel?.font = UIFont.systemFont(ofSize: 19, weight: .light)
        detailTextLabel?.numberOfLines = 2
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
