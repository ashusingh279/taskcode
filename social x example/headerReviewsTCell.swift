//
//  SceneDelegate.swift
//  social x example
//
//  Created by admin on 15/08/20.
//  Copyright © 2020 admin. All rights reserved.
//
import UIKit

class headerReviewsTCell: UITableViewCell {
    @IBOutlet weak var btnHeader: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var lefticonimageView: UIImageView!
    @IBOutlet weak var downiconimageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
