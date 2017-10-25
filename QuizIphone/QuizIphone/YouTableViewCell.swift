//
//  YouTableViewCell.swift
//  QuizIphone
//
//  Created by Dora The Explorer on 25/10/17.
//  Copyright © 2017 Naufel. All rights reserved.
//

import UIKit

class YouTableViewCell: UITableViewCell {

    @IBOutlet weak var labelDes: UILabel!
    @IBOutlet weak var labelTask: UILabel!
    @IBOutlet weak var labelDay: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
