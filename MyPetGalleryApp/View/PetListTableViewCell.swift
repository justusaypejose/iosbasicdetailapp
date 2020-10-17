//
//  TableViewCell.swift
//  MyPetGalleryApp
//
//  Created by Justus Aype Jose on 17/10/20.
//

import UIKit

class PetListTableViewCell: UITableViewCell {

    @IBOutlet weak var petAge: UILabel!
    @IBOutlet weak var petName: UILabel!
    @IBOutlet weak var petImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
