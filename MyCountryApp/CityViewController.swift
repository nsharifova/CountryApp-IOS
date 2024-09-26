//
//  CityViewController.swift
//  MyCountryApp
//
//  Created by Nurluay Sharifova on 15.09.24.
//

import UIKit

class CityViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var city : CityData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let city {
            textLabel.numberOfLines = 0
            textLabel.text = city.description
            imageView.image = UIImage(named: city.image)
            
        }
        
        
        
    }
    
    
    
    
}
