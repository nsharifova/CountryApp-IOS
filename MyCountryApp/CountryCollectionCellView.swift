//
//  CountryCollectionCellView.swift
//  MyCountryApp
//
//  Created by Nurluay Sharifova on 20.09.24.
//

import UIKit

class CountryCollectionCellView: UICollectionViewCell {
    
    @IBOutlet weak var labelField: UILabel!
    @IBOutlet weak var imageField: UIImageView!
    
    func configure (data: Country) {
        labelField.text = data.name
        imageField.image = UIImage(named: data.image) 

    }
}
