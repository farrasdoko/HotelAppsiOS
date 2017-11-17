//
//  TableViewCell.swift
//  HotelAppsiOS
//
//  Created by Gw on 17/11/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelrate2: UILabel!
    @IBOutlet weak var labelrate: UILabel!
    @IBOutlet weak var labeljl: UILabel!
    @IBOutlet weak var labelnh: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
