//
//  celdaPropiaTableViewCell.swift
//  examen
//
//  Created by Oscar on 15/6/17.
//  Copyright © 2017 Oscar. All rights reserved.
//

import UIKit

class celdaPropiaTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var tituloLabel: UILabel!
    
    @IBOutlet weak var imagenPrincipal: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
