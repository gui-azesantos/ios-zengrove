//
//  ESGTableViewCell.swift
//  ESG-ZenGrove
//
//  Created by De Azevedo Santos, Guilherme on 07/03/24.
//

import UIKit

class ESGTableViewCell: UITableViewCell {


    @IBOutlet weak var lbTitle: UILabel!
    
    @IBOutlet weak var lbType: UILabel!
    
    @IBOutlet weak var lbPontuation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
