//
//  realmManager.swift
//  Shopper
//
//  Created by 쌩 on 7/9/24.
//

import Foundation

class realmManager{
    
    private let realm = try! Realm()
    
    func createReminder(data: Reminder) {
        let data = data
        do {
            try realm.write({
                realm.add(data)
            })
        } catch {
            print("data 생성에 error가 발생하였습니다..")
        }
    }
    
    func readFilterdReminders(filter: FilteringType) -> [Reminder] {
        let value = realm.objects(Reminder.self)
        var result: Results<Reminder>
        switch filter {
        case .all:
            result = value
        case .today:
            result = value.where({
                $0.deadLine <= Date()
            })
        case .scheduled:
            result = value
        case .flagged:
            result = value.where {
                $0.flag == true
            }
        case .completed:
            result = value.where {
                $0.isDone == true
            }
        }
        return Array(result)
    }
    
    func deleteReminder(id: ObjectId, completion: @escaping() -> ()) {
        if let reminder = realm.object(ofType: Reminder.self, forPrimaryKey: id) {
            do {
                try realm.write {
                    realm.delete(reminder)
                    completion()
                }
            } catch {
                print("data 삭제에 error가 발생하였습니다..")
            }
        }
    }
}
