//
//  NewTableViewCell.swift
//  News
//
//  Created by ENES AKSOY on 10.07.2019.
//  Copyright © 2019 ENES AKSOY. All rights reserved.
//

import UIKit



class NewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var url: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
