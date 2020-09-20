//
//  CustomTableViewCell.swift
//  API_practice
//
//  Created by MACUser on 2020/09/01.
//  Copyright © 2020 MACUser. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var id: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(model: article) {
        title.text = model.title
        id.text = model.userId
    }

}
