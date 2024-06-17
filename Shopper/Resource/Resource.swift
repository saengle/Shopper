//
//  SColors.swift
//  Shopper
//
//  Created by 쌩 on 6/13/24.
//

import UIKit
enum Sort: String {
    case sim = "정확도"
    case date = "날짜순"
    case asc = "가격낮은순"
    case dsc = "가격높은순"
}

enum Resource {
    
    enum Font {
        static let normal13 = UIFont.systemFont(ofSize: 13)
        static let normal14 = UIFont.systemFont(ofSize: 14)
        static let normal15 = UIFont.systemFont(ofSize: 15)
        static let normal16 = UIFont.systemFont(ofSize: 16)
        
        static let bold13 = UIFont.boldSystemFont(ofSize: 13)
        static let bold14 = UIFont.boldSystemFont(ofSize: 14)
        static let bold15 = UIFont.boldSystemFont(ofSize: 15)
        static let bold16 = UIFont.boldSystemFont(ofSize: 16)
    }
    
    enum MyColors {
        static let primary = #colorLiteral(red: 0.9564719796, green: 0.610019803, blue: 0.3464771509, alpha: 1)
        static let black = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        static let gray = #colorLiteral(red: 0.5815095305, green: 0.5815094709, blue: 0.5815094709, alpha: 1)
        static let darkGray = #colorLiteral(red: 0.3705568314, green: 0.3705568314, blue: 0.3705568314, alpha: 1)
        static let lightGray = #colorLiteral(red: 0.8407003284, green: 0.8407003284, blue: 0.8407003284, alpha: 1)
        static let white = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    enum Image {
        enum ImageSize {
            case big
            case selected
            case unSelected
        }
        enum ImageList: String, CaseIterable {
            case profile = "profile_0"
            var list: [String] { // 인스턴스 연산 프로퍼티
                switch self {
                case .profile:
                    return [ "profile_0", "profile_1", "profile_3", "profile_4", "profile_5", "profile_6", "profile_7", "profile_8", "profile_9", "profile_10", "profile_11" ]
                }
            }
        }
    }
}

enum settingOptions: String, CaseIterable {
    case myList = "나의 장바구니 목록"
    case offenQuestion = "실험실"
    case qna = "버전정보"
    case alarm = "알람 설정"
    case withdraw = "탈퇴하기"
}
