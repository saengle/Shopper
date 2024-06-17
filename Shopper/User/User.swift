//
//  User.swift
//  Shopper
//
//  Created by 쌩 on 6/17/24.
//

import Foundation

struct Guest {
    let isUser: Bool
    let user: [User]
}

struct User {
    
    let searchedList: [Int]
    let likeList: [Int]
    let userName: String
    let userProfile: String
}

