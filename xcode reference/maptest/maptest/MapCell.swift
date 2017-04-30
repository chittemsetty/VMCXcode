//
//  MapCell.swift
//  maptest
//
//  Created by Venu Chittemsetty on 3/5/16.
//  Copyright © 2016 Vedya Wonders. All rights reserved.
//

import UIKit
import MapKit

class MapCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var mapView: MKMapView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
