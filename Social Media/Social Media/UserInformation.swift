//
//  UserInformation Model.swift
//  Social Media
//
//  Created by Mac on 13/10/2022.
//

import Foundation

struct UserInformation : Codable {
    var firstName : String
    var lastName : String
    var location : String
    var phone : String
    var profession : String
    var studies : String
    var mail : String

    init (firstName : String, lastName : String, location : String, phone : String, profession : String, studies : String, mail : String){
        self.firstName = firstName
        self.lastName = lastName
        self.location = location
        self.phone = phone
        self.profession = profession
        self.studies = studies
        self.mail = mail
    }
}
