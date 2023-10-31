//
//  ProfileModel.swift
//  profile-app
//
//  Created by Донских Елена on 04.10.2023.
//

import Foundation

public struct ProfileModel {
    let avatar: String?
    let firstName: String
    let secondName: String
    let middleName: String
    let alias: String
    let mail: String
    let phone: String
    let telegram: String
    
    public init(avatar: String? = nil, firstName: String = "", secondName: String = "", middleName: String = "", alias: String = "", mail: String = "", phone: String = "", telegram: String = "") {
        self.avatar = avatar
        self.firstName = firstName
        self.secondName = secondName
        self.middleName = middleName
        self.alias = alias
        self.mail = mail
        self.phone = phone
        self.telegram = telegram
    }
}
