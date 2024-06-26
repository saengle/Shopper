//
//  Shop.swift
//  Shopper
//
//  Created by 쌩 on 6/16/24.
//

import Foundation

// MARK: - Shop
struct Shop: Codable {
    let lastBuildDate: String?
    let total, start, display: Int?
    let items: [Item]?
}

// MARK: - Item
struct Item: Codable {
    let title: String?
    let link: String?
    let image: String?
    let lprice, hprice, mallName, productID: String?
    let productType: String?
    let brand, maker: String?
    let category1: String?
    let category2: String?
    let category3: String?
    let category4: String?

    enum CodingKeys: String, CodingKey {
        case title, link, image, lprice, hprice, mallName
        case productID = "productId"
        case productType, brand, maker, category1, category2, category3, category4
    }
}
