//
//  eventCell.swift
//  FitnessKit
//
//  Created by Всеволод Козлов on 14.02.2020.
//  Copyright © 2020 Всеволод Козлов. All rights reserved.
//

import UIKit

class eventCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weekDayStrLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var teacherLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
