//
//  ProfileStorageLogic.swift
//  profile-app
//
//  Created by Донских Елена on 04.10.2023.
//
import Foundation

protocol ProfileStorageLogic {
    func save(_ profile: ProfileModel)
    func read() -> ProfileModel
}
