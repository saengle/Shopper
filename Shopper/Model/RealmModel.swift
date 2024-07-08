//
//  RealmModel.swift
//  Shopper
//
//  Created by 쌩 on 7/9/24.
//

import RealmSwift

class Reminder: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted(indexed: true) var title: String
    @Persisted var link: String
    @Persisted var lprice: String
    @Persisted var mallName: String
    @Persisted var imagePath: String
    
    convenience init(title: String ,link: String, lprice: String, mallName: String, imagePath: String) {
        self.init()
        self.title = title
        self.link = link
        self.lprice = lprice
        self.mallName = mallName
        self.imagePath = imagePath
    }
}
