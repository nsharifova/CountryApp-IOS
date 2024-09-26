//
//  CountryData.swift
//  MyCountryApp
//
//  Created by Nurluay Sharifova on 15.09.24.
//

import Foundation
import UIKit

struct CityData {
    var name : String
    var image : String
    var description : String
}
struct Country {
    var name : String
    var image : String
    var city : [CityData]
    
}
