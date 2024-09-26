//
//  UserData.swift
//  MyCountryApp
//
//  Created by Nurluay Sharifova on 15.09.24.
//

import Foundation
struct UserData {
    var email: String
    var password : String
    func isPasswordValid () -> Bool {
        return password.count >= 5 && password.count <= 15
        
    }
}
