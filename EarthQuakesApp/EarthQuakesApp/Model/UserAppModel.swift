//
//  UserAppModel.swift
//  EarthQuakesApp
//
//  Created by Cristian Bahamondes on 21-02-24.
//

import Foundation

struct UserAppModel: Codable {
    var name: String
    var lastName: String
    var password: String
    var repeatPassword: String
    var email: String
}
