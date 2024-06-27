//
//  User.swift
//  Shopper
//
//  Created by 쌩 on 6/17/24.
//

import Foundation

struct User {
    static var isUser: Bool {
        get { UserDefaults.standard.bool(forKey: "isUser") }
        set { UserDefaults.standard.set(newValue, forKey: "isUser") }
    }
    static var userProfile: String {
        get { UserDefaults.standard.string(forKey: "userProfile") ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: "userProfile") }
    }
    static var signInDay: String {
        get { UserDefaults.standard.string(forKey: "signInDay") ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: "signInDay") }
    }
    static var searchedList: [String] {
        get { UserDefaults.standard.stringArray(forKey: "searchedList") ?? [] }
        set { UserDefaults.standard.set(newValue, forKey: "searchedList") }
    }
    static var likeList: [String] {
        get { UserDefaults.standard.stringArray(forKey: "likeList") ?? [] }
        set { UserDefaults.standard.set(newValue, forKey: "likeList") }
    }
    static var userName: String {
        get { UserDefaults.standard.string(forKey: "userName") ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: "userName") }
    }
    static var keyWord: String {
        get { UserDefaults.standard.string(forKey: "keyWord") ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: "keyWord") }
    }
    static var detailKeyWord: String {
        get { UserDefaults.standard.string(forKey: "keyWord") ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: "keyWord") }
    }
    static var link: String {
        get { UserDefaults.standard.string(forKey: "link") ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: "link") }
    }
    static var nowId: String {
        get { UserDefaults.standard.string(forKey: "nowId") ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: "nowId") }
    }
    static func deleteAllUserData() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}

