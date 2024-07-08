//
//  realmManager.swift
//  Shopper
//
//  Created by 쌩 on 7/9/24.
//

import Foundation

import RealmSwift

final class RealmManager{
    
    static let shared = RealmManager()
    private let realm = try! Realm()
    
    func createLike(data: RealmModel) {
        let data = data
        do {
            try realm.write({
                realm.add(data)
            })
        } catch {
            print("data 생성에 error가 발생하였습니다..")
        }
    }
    
    func readLikes() -> [RealmModel] {
        let likes = realm.objects(RealmModel.self)
        return Array(likes)
    }
    
    func deleteLike(id: String) {
        if let like = realm.object(ofType: RealmModel.self, forPrimaryKey: id) {
            do {
                try realm.write {
                    realm.delete(like)
                }
            } catch {
                print("data 삭제에 error가 발생하였습니다..")
            }
        }
    }
    func deleteAll() {
        do {
            try? realm.write {
                realm.deleteAll()
            }
        } catch {
            print("data 삭제에 error가 발생하였습니다.")
        }
    }
}
