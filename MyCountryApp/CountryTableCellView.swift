//
//  CountryTableCellView.swift
//  MyCountryApp
//
//  Created by Nurluay Sharifova on 16.09.24.
//

import UIKit

class CountryTableCellView: UITableViewCell {
    
    
    @IBOutlet weak var countyNameLabel: UILabel!
    @IBOutlet weak var countryImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let imageView = countryImageView {
            imageView.layer.cornerRadius = imageView.frame.size.width / 2
        }
    }
    
    private func setupCell() {
        guard let imageView = countryImageView,
                let nameLabel = countyNameLabel
        else {
            print("nil")
            return
        }
        
        
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        
        
    }
    func configure (data: Country) {
        countyNameLabel.text = data.name
        countryImageView.image = UIImage(named: data.image)
    }
}
