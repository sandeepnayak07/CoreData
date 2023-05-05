//
//  TableViewCell.swift
//  DemoCore
//
//  Created by West Agile labs on 02/05/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblCity: UILabel!
    @IBOutlet var lblAddress: UILabel!
    @IBOutlet var lblMobile: UILabel!
    
    var person: Person! {
        didSet {
            lblName.text = person.name
            lblAddress.text = person.address
            lblCity.text = person.city
            lblMobile.text = person.mobile
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

}
