//
//  CustomCollectionViewCell.swift
//  MyCountryApp
//
//  Created by Nurluay Sharifova on 21.09.24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelField: UILabel!
    @IBOutlet weak var imageField: UIImageView!
    
    func configure (data: Country) {
        labelField.text = data.name
        imageField.image = UIImage(named: data.image)
    }
    func configureCity (data: CityData) {
        labelField.text = data.name
        imageField.image = UIImage(named: data.image)
    }
    
}
