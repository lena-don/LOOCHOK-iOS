//
//  ProfileStorageWorker.swift
//  profile-app
//
//  Created by Донских Елена on 04.10.2023.
//

import Foundation

class ProfileStorageWorker: ProfileStorageLogic {
    
    private struct Keys {
        static let avatar = "avatar"
        static let firstName = "firstName"
        static let secondName = "secondName"
        static let middleName = "middleName"
        static let alias = "alias"
        static let mail = "mail"
        static let phone = "phone"
        static let telegram = "telegram"
    }
    
    
    func save(_ profile: ProfileModel) {
        //let avatar: String = profile.avatar ?? ""
        UserDefaults.standard.set(profile.avatar, forKey: Keys.avatar)
        
        UserDefaults.standard.set(profile.firstName, forKey: Keys.firstName)
        UserDefaults.standard.set(profile.secondName, forKey: Keys.secondName)
        UserDefaults.standard.set(profile.middleName, forKey: Keys.middleName)
        
        UserDefaults.standard.set(profile.alias, forKey: Keys.alias)
        UserDefaults.standard.set(profile.mail, forKey: Keys.mail)
        UserDefaults.standard.set(profile.phone, forKey: Keys.phone)
        UserDefaults.standard.set(profile.telegram, forKey: Keys.telegram)
        
        UserDefaults.standard.synchronize()
    }
    
    func read() -> ProfileModel {
        let avatar = UserDefaults.standard.string(forKey: Keys.avatar)
        
        let firstName = UserDefaults.standard.string(forKey: Keys.firstName)
        let secondName = UserDefaults.standard.string(forKey: Keys.secondName)
        let middleName = UserDefaults.standard.string(forKey: Keys.middleName)
        
        let alias = UserDefaults.standard.string(forKey: Keys.alias)
        let mail = UserDefaults.standard.string(forKey: Keys.mail)
        let phone = UserDefaults.standard.string(forKey: Keys.phone)
        let telegram = UserDefaults.standard.string(forKey: Keys.telegram)
        
        return ProfileModel(
            avatar: avatar,
            firstName: firstName ?? "",
            secondName: secondName ?? "",
            middleName: middleName ?? "",
            alias: alias ?? "",
            mail: mail ?? "",
            phone: phone ?? "",
            telegram: telegram ?? "")
    }
    
    
   
}
