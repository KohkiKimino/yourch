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

    func configure(model: article) {
        title.text = model.title
        id.text = model.userId
    }

}
