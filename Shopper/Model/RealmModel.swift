//
//  RealmModel.swift
//  Shopper
//
//  Created by 쌩 on 7/9/24.
//

import RealmSwift

class RealmModel: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted(indexed: true) var title: String
    @Persisted var link: String
    @Persisted var lprice: String
    @Persisted var mallName: String
    @Persisted var imagePath: String
    
    convenience init(id: String, title: String ,link: String, lprice: String, mallName: String, imagePath: String) {
        self.init()
        self.id = id
        self.title = title
        self.link = link
        self.lprice = lprice
        self.mallName = mallName
        self.imagePath = imagePath
    }
}
