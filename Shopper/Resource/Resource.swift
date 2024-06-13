//
//  SColors.swift
//  Shopper
//
//  Created by 쌩 on 6/13/24.
//

import UIKit


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
        
        enum ImageStyle {
            static let image0 = UIImage(named: "profile_0")
            static let image1 = UIImage(named: "profile_1")
            static let image2 = UIImage(named: "profile_2")
            static let image3 = UIImage(named: "profile_3")
            static let image4 = UIImage(named: "profile_4")
            static let image5 = UIImage(named: "profile_5")
            static let image6 = UIImage(named: "profile_6")
            static let image7 = UIImage(named: "profile_7")
            static let image8 = UIImage(named: "profile_8")
            static let image9 = UIImage(named: "profile_9")
            static let image10 = UIImage(named: "profile_10")
        }
    }
}
